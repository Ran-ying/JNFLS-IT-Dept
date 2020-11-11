<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html><head><title>nowcast</title><link rel="stylesheet" type="text/css" href="forecast_style.css" /></head>
<?php date_default_timezone_set("Asia/Shanghai");?>
<?php
function load_metar_text()
{
	$metar_html = file_get_contents('http://www.intellicast.com/Local/Weather.aspx?location=CHXX0064');
	preg_match('/>&nbsp;ZSJN[\s\S]*? </',$metar_html,$metar_re_match_i);
	$metar_re_match_ii = preg_replace('/[<&nbsp;>]/','',$metar_re_match_i[0]);
	return $metar_re_match_ii;
}
function load_taf_text()
{
	$taf_html = file_get_contents('http://aviationweather.gov/adds/tafs/?station_ids=ZSJN&std_trans=standard&submit_taf=Get+TAFs');
	preg_match('/TAF\sZSJN[\s\S]*?</',$taf_html,$taf_re_match_i);
	$taf_re_match_ii = preg_replace('/\s{6}/','',$taf_re_match_i[0]);
	$taf_re_match_iii = preg_replace('/TAF /','',$taf_re_match_ii);
	$taf_re_match_iv = preg_replace('/\s\s</','',$taf_re_match_iii);
	return $taf_re_match_iv;
}
function alert_div_formated($weather_array)
{
	if($weather_array[0]=='NOSIG')
		{
		$ahead=$weather_array['AvailableTime'];
		$nowcast_weather='--';
		$type='�����������仯';
		$behind=$weather_array['publish_time'];
			$returnhtml = "<div class='alert'><div class='alert_ahead'>$ahead</div><div class='alert_content'><div class='alert_weather'>$nowcast_weather</div><div class='alert_type'>--$type</div></div><div class='alert_behind'>$behind</div></div><br />";
		}
	else
		{
			$returnhtml='';
			foreach($weather_array as $value_group)
				{
					$content_html='';
					$type=$value_group[0];
					$nowcast=$value_group[1];
					$ahead=$nowcast[0]['ForecastTime'];
					array_shift($nowcast);//ȥ��ʱ��
					$behind=$value_group[2];
					$content_html=$content_html."<div class='alert'><div class='alert_ahead'>$ahead</div>";
					foreach($nowcast as $value)
						{
							$nowcast_weather=$value['value'];
							$content_html=$content_html."<div class='alert_content'><div class='alert_weather'>$nowcast_weather</div><div class='alert_type'>--$type</div></div>";
						}
					$content_html=$content_html."<div class='alert_behind'>$behind</div></div><br />";
					$returnhtml=$returnhtml.$content_html;
				}
		}
	return $returnhtml;
}
function present_weather_div_formated($weather_array)
{
	$publish_time=$weather_array[0]['publish_time'].' ��ǰ����';
	array_shift($weather_array);/*ȥ������ʱ��*/array_shift($weather_array);//ȥ����Чʱ��
	$ahead_html = "<div class='present'><div class='present_ahead'>$publish_time</div>";
	$content_html = "";
	foreach($weather_array as $line)
		{
			$type=$line['type'];
			$weather_value=$line['value'];
			$content_html = $content_html."<div class='present_content'><div class='present_weather'>$weather_value</div><div class='present_type'>$type</div></div>";
		}
	$behind_html = "<div class='present_behind'>������������</div></div><br />";
	$returnhtml = $ahead_html.$content_html.$behind_html;
	return $returnhtml;
}
function devide_raw_text($raw_forecast)
{
/*
for the input string='ZSJN 170319Z 170606 17003MPS 5000 HZ NSC BECMG 1618 2400 -RA BR BKN010 OVC030 BECMG 0103 3500 RA BR'
the output will be an array = Array ( [present] => Array ( [0] => ZSJN [1] => 170319Z [2] => 170606 [3] => 17003MPS [4] => 5000 [5] => HZ [6] => NSC [7] => ) [nowcast] => Array ( [0] => Array ( [0] => [1] => 1618 [2] => 2400 [3] => -RA [4] => BR [5] => BKN010 [6] => OVC030 [7] => ) [1] => Array ( [0] => [1] => 0103 [2] => 3500 [3] => RA [4] => BR ) ) )
*/
	$forecast_array_i = preg_split('/(BECMG|TEMPO|PROB30|PROB40|NOSIG)/',$raw_forecast,-1,PREG_SPLIT_NO_EMPTY|PREG_SPLIT_DELIM_CAPTURE);
	$forecast_array['present'] = $forecast_array_i[0];
	array_shift($forecast_array_i);
	$forecast_array['nowcast'] = $forecast_array_i;
	$forecast_array['present']=explode(' ',$forecast_array['present']);
	
	foreach($forecast_array['nowcast'] as $i=>$value)
		{
			$forecast_array['nowcast'][$i]=explode(' ',$value);
		}
	return $forecast_array;
}
function decode_weather($forecast_array)
{
/*
 * input array format:
 * Array ( [0] => ZSJN [1] => 170319Z [2] => 170606 [3] => 17003MPS [4] => 5000 [5] => HZ [6] => NSC [7] => ) 
 * as the raw_forecast='ZSJN 170319Z 170606 17003MPS 5000 HZ NSC BECMG 1618 2400 -RA BR BKN010 OVC030 BECMG 0103 3500 RA BR'
 * the output:
 * Array ( [0] => Array ( [type] => ���� [value] => 3m/s ) [1] => Array ( [type] => ���� [value] => S ) [2] => Array ( [type] => �Ʋ� [value] => --- ) )
*/
$present_array[]=re_formated_time($forecast_array[1]);
if($forecast_array[0]!='')$present_array[]=re_formated_time($forecast_array[2]);

$reWindKT = '/^(\d{3}|VRB)(\d{2,3})(G\d{2,3})?(KT|MPS|KMH)$/'; //��
$reVariableWind = '/^(\d{3})V(\d{3})$/'; //��������
$reQNHhPa = '/Q\d{3,4}/'; //��ѹ
$reCloud = '/^(FEW|SCT|BKN|OVC)(\d{3})(CB|TCU)?$/'; //��
$reTempDew = '/^(M?\d\d|\/\/)\/(M?\d\d)?$/'; //�¶�
$reWX = '/^(\-|\+)?(VC)?(MI|BC|BL|SH|TS|FZ|PR)?(DZ|RA|SN|SG|IC|PL|GR|GS)?(DZ|RA|SN|SG|IC|PL|GR|GS)?(DZ|RA|SN|SG|IC|PL|GR|GS)?(DZ|RA|SN|SG|IC|PL|GR|GS)?(DZ|RA|SN|SG|IC|PL|GR|GS|BR|FG|FU|VA|DU|SA|HZ|PO|SQ|FC|SS|DS)$/'; //����״��
$array_reWX=array('-'=>'[С]','+'=>'[��]','VC'=>'[������]','MI'=>'[ǳ��]','BC'=>'[ɢ��]','SH'=>'[����]','TS'=>'�ױ�','FZ'=>'[������]','PR'=>'[���ֵ�]','DZ'=>'ëë��','RA'=>'��','SN'=>'ѩ','SG'=>'��ѩ','IC'=>'����','PL'=>'����','GR'=>'����','GS'=>'С����','BR'=>'����','FG'=>'��','FU'=>'��','VA'=>'��ɽ��','DU'=>'�ﳾ','SA'=>'ɳ','HZ'=>'��','PO'=>'ɳ����','SQ'=>'����','FC'=>'©����','SS'=>'ɳ��','DS'=>'����','DR'=>'[Ʈ����]','BL'=>'[�紵��]');
	foreach($forecast_array as $col=>$value)
	{
		if(preg_match($reWX,$value))
			{//����״��
				$adj = '';
				preg_match($reWX,$value,$weather_array);
				array_shift($weather_array);
				$weather_array = array_filter($weather_array);
				$weather_array = array_flip(array_flip($weather_array));
				$present_condition='';
				foreach($weather_array as $conditions)
					{
					$present_condition = $present_condition.$array_reWX[$conditions];
					}
				$present_array[]=array('type'=>'����','value'=>$present_condition);
			}
		if(preg_match($reVariableWind,$value))
			{//��������
				$wind_direction=reWindDirection(substr($value,0,3)).'~'.reWindDirection(substr($value,4,3));
				$present_array[]=array('type'=>'����仯��Χ','value'=>$wind_direction);
			}
		if(preg_match($reWindKT,$value,$wind_array))
			{//��
				$unit = $wind_array[4]; //������λ
				if($unit=="KT")$unit = '��';
				else if($unit=="KMH")$unit='km/h';
				else if($unit=="MPS")$unit='m/s';
				$wind_speed = (int)$wind_array[2].$unit;
				$wind_direction = (int)$wind_array[1];
				if ($wind_array[3]!="")
					{	//���
						$wind_speed="���".(int)substr($wind_array[3],1,sizeof($wind_array[3])).$unit;
					}
				$present_array[]=array('type'=>'����','value'=>$wind_speed);
				$present_array[]=array('type'=>'����','value'=>reWindDirection($wind_direction));
			}
		if(preg_match($reQNHhPa,$value,$QNHhPa))
			{//��ѹ
				$qnhpa = (int)substr($QNHhPa[0],1,4);
				$present_array[] = array('type'=>'��ѹ','value'=>$qnhpa.'hPa');
			}
		if($value=='SCK')$present_array[]=array('type'=>'�Ʋ�','value'=>'���');
		if($value=='NSC')$present_array[]=array('type'=>'�Ʋ�','value'=>'---');//���ر��Ʋ�
		if(preg_match($reCloud,$value,$cloud_array))
			{//��
				$cloud_array[]='';
				if($cloud_array[1]=='FEW')$cloud_m='����';
				if($cloud_array[1]=='SCT')$cloud_m='����';
				if($cloud_array[1]=='BKN')$cloud_m='����';
				if($cloud_array[1]=='OVC')$cloud_m='������';
				$cloud_h=(int)(30.48*(int)$cloud_array[2]).'m:';
				if($cloud_array[3]=='CB')$cloud_h=$cloud_h.'������';
				if($cloud_array[3]=='TCU')$cloud_h=$cloud_h.'��״����';
				$present_array[]=array('type'=>$cloud_h,'value'=>$cloud_m);//$present_array[]=$cloud_array; //������
			}
		if(preg_match($reTempDew,$value,$temp_array))
			{
			if(substr($temp_array[1],0,1)=='M')
				{
					$present_array[]=array('type'=>'�¶�','value'=>(-1)*(int)substr($temp_array[1],1,2).'��');
				}
			else
				{
					$present_array[]=array('type'=>'�¶�','value'=>(int)substr($temp_array[1],0,2).'��');
				}
			if($temp_array[2]!='')
				{
					if(substr($temp_array[2],0,1)=='M')
					{
						$present_array[]=array('type'=>'¶��','value'=>(-1)*(int)substr($temp_array[2],1,2).'��');
					}
					else
					{
						$present_array[]=array('type'=>'¶��','value'=>(int)substr($temp_array[2],0,2).'��');
					}
				}
			}
	}
return $present_array;
}
function decode_nowcast($nowcast_array)
	{
	$i=0;//������
	$publish_time=$nowcast_array['publish_time'].'����';
	$available_time=$nowcast_array['AvailableTime'].'��Ч';
	$behind=$publish_time.'<br />'.$available_time;
	$reNowcastType=array('BECMG'=>'��������','TEMPO'=>'��ʱ�仯','PROB30'=>'30%����','PROB40'=>'40%����','NOSIG'=>'�����������仯');
	
	if(array_key_exists(0,$nowcast_array))
		{
			if($nowcast_array[0][0]=='NOSIG')
				{
					$nowcast=array(0=>'NOSIG','publish_time'=>$publish_time,'AvailableTime'=>'2Сʱ��');
				}
			else
				{
					foreach($nowcast_array as $col=>$value_group)
						{
							if(sizeof($value_group)>1)
								{	
									$nowcast_type=$nowcast_array[$col-1][0];
									$nowcast_type=$reNowcastType[$nowcast_type];
									$nowcast[]=array($nowcast_type,decode_weather($value_group),$behind);
									$i++;
								}
						}
				}
		}
	else if(sizeof($nowcast_array)==2)
			{
				$nowcast=array(0=>'NOSIG','publish_time'=>$publish_time,'AvailableTime'=>$nowcast_array['AvailableTime']);
			}
	return $nowcast;
	}
function re_formated_time($raw_time)
	{
	$re='';
	$rePublishTime='/^(\d{2})(\d{2})(\d{2})Z$/';
	$reTAFAvailableTime='/^(\d{2})(\d{2})(\d{2})$/';
	$reTAFForecastTime='/^(\d{2})(\d{2})$/';
	$reFMATTL='/^(FM|AT|TL)(\d{2})(\d{2})Z?$/';
	$FMATTL_array=array('FM'=>array('��','��ʼ'),'AT'=>array('�� ',''),'TL'=>array('��','Ϊֹ'));
	if(preg_match($rePublishTime,$raw_time,$time_array))
		{//����ʱ��,��'180311Z'תΪ'hh:mm'��'����hh:mm'
			if((int)$time_array[2]>16)$p_date = (int)($time_array[1]+1);
				else $p_date = (int)$time_array[1];//����
			$p_hour = ((int)$time_array[2]+8)%24;//Сʱ,��UTCʱ��ת��Ϊ8ʱ��ʱ��
			$p_min = $time_array[3];
			$p_time = $p_hour.':'.$p_min;
			$re = array('publish_time'=>$p_time);
		}
	if(preg_match($reTAFAvailableTime,$raw_time,$time_array))
		{//TAFԤ������,��'180606'תΪ''
			if((int)$time_array[2]>16)$p_date = (int)($time_array[1]+1);
				else $p_date = (int)$time_array[1];//����
			$fm_hour = ((int)$time_array[2]+8)%24;//��ʼ
			$tw_hour = ((int)$time_array[3]+8)%24;//����
			if($tw_hour<=$fm_hour)$tw_hour='����'.$tw_hour;
			$p_time = $fm_hour.':00~'.$tw_hour.':00';
			$re = array('AvailableTime'=>$p_time);
		}
	if(preg_match($reTAFForecastTime,$raw_time,$time_array))
		{//TAFԤ��ʱ��,��'0002'תΪ'8:00 ~ 10:00'
			$fm_hour = ((int)$time_array[1]+8)%24;//��ʼ
			$tw_hour = ((int)$time_array[2]+8)%24;//����
			if($tw_hour<=$fm_hour)$tw_hour='����'.$tw_hour;
			$p_time = $fm_hour.':00 ~ '.$tw_hour.':00';
			$re = array('ForecastTime'=>$p_time);
		}
	if(preg_match($reFMATTL,$raw_time,$time_array))
		{//METARԤ��ʱ��,��'FM0700'תΪ'��15:00��ʼ'
			$p_hour = ((int)$time_array[2]+8)%24;//Сʱ,��UTCʱ��ת��Ϊ8ʱ��ʱ��
			$p_min = $time_array[3];
			$p_time = $p_hour.':'.$p_min;
			$re = array('ForecastTime'=>$FMATTL_array[$time_array[1]][0].$p_time.$FMATTL_array[$time_array[1]][1]);
		}
	return $re;
	}
function reWindDirection($degree)
	{//������ӽǶ�תΪ��λ,������������22.5�ȷ�Χ��Ϊ'N'
	$degree=(float)$degree;
	$direction='';
	if(22.5>$degree || $degree>337.5)$direction='N';
	if(67.5>$degree && $degree>22.5)$direction='NE';
	if(337.5>$degree && $degree>292.5)$direction='NW';
	if(292.5>$degree && $degree>337.5)$direction='W';
	if(112.5>$degree && $degree>67.5)$direction='E';
	if(247.5>$degree && $degree>202.5)$direction='SW';
	if(157.5>$degree && $degree>112.5)$direction='SE';
	if(202.5>$degree && $degree>157.5)$direction='S';
	return $direction;
	}
?>
<?php
//�ٽ�Ԥ�������ʼ
$metar_array = devide_raw_text(load_metar_text());
$taf_array = devide_raw_text(load_taf_text());
$metar_nowcast = $metar_array['nowcast'];
$taf_nowcast= $taf_array['nowcast'];
$present_metar=decode_weather($metar_array['present']);
$present_taf=decode_weather($taf_array['present']);
$metar_nowcast['publish_time']=$present_metar[0]['publish_time'];
$taf_nowcast['publish_time']=$present_taf[0]['publish_time'];
$metar_nowcast['AvailableTime']='2Сʱ��';
$taf_nowcast['AvailableTime']=$present_taf[1]['AvailableTime'];
print_r(alert_div_formated(decode_nowcast($metar_nowcast)));
print_r(alert_div_formated(decode_nowcast($taf_nowcast)));
//�ٽ�Ԥ���������
//��ǰ����״�����
print_r(present_weather_div_formated($present_metar));
//��ǰ����״���������
?>
</html>