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
		$type='无明显天气变化';
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
					array_shift($nowcast);//去掉时间
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
	$publish_time=$weather_array[0]['publish_time'].' 当前天气';
	array_shift($weather_array);/*去掉发布时间*/array_shift($weather_array);//去掉有效时间
	$ahead_html = "<div class='present'><div class='present_ahead'>$publish_time</div>";
	$content_html = "";
	foreach($weather_array as $line)
		{
			$type=$line['type'];
			$weather_value=$line['value'];
			$content_html = $content_html."<div class='present_content'><div class='present_weather'>$weather_value</div><div class='present_type'>$type</div></div>";
		}
	$behind_html = "<div class='present_behind'>机场天气报告</div></div><br />";
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
 * Array ( [0] => Array ( [type] => 风速 [value] => 3m/s ) [1] => Array ( [type] => 风向 [value] => S ) [2] => Array ( [type] => 云层 [value] => --- ) )
*/
$present_array[]=re_formated_time($forecast_array[1]);
if($forecast_array[0]!='')$present_array[]=re_formated_time($forecast_array[2]);

$reWindKT = '/^(\d{3}|VRB)(\d{2,3})(G\d{2,3})?(KT|MPS|KMH)$/'; //风
$reVariableWind = '/^(\d{3})V(\d{3})$/'; //不定风向
$reQNHhPa = '/Q\d{3,4}/'; //气压
$reCloud = '/^(FEW|SCT|BKN|OVC)(\d{3})(CB|TCU)?$/'; //云
$reTempDew = '/^(M?\d\d|\/\/)\/(M?\d\d)?$/'; //温度
$reWX = '/^(\-|\+)?(VC)?(MI|BC|BL|SH|TS|FZ|PR)?(DZ|RA|SN|SG|IC|PL|GR|GS)?(DZ|RA|SN|SG|IC|PL|GR|GS)?(DZ|RA|SN|SG|IC|PL|GR|GS)?(DZ|RA|SN|SG|IC|PL|GR|GS)?(DZ|RA|SN|SG|IC|PL|GR|GS|BR|FG|FU|VA|DU|SA|HZ|PO|SQ|FC|SS|DS)$/'; //天气状况
$array_reWX=array('-'=>'[小]','+'=>'[大]','VC'=>'[附近的]','MI'=>'[浅的]','BC'=>'[散的]','SH'=>'[阵性]','TS'=>'雷暴','FZ'=>'[冰冻的]','PR'=>'[部分的]','DZ'=>'毛毛雨','RA'=>'雨','SN'=>'雪','SG'=>'米雪','IC'=>'冰晶','PL'=>'冰粒','GR'=>'冰雹','GS'=>'小冰雹','BR'=>'轻雾','FG'=>'雾','FU'=>'烟','VA'=>'火山灰','DU'=>'扬尘','SA'=>'沙','HZ'=>'霾','PO'=>'沙尘卷','SQ'=>'暴风','FC'=>'漏斗云','SS'=>'沙暴','DS'=>'尘暴','DR'=>'[飘动的]','BL'=>'[风吹的]');
	foreach($forecast_array as $col=>$value)
	{
		if(preg_match($reWX,$value))
			{//天气状况
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
				$present_array[]=array('type'=>'天气','value'=>$present_condition);
			}
		if(preg_match($reVariableWind,$value))
			{//不定风向
				$wind_direction=reWindDirection(substr($value,0,3)).'~'.reWindDirection(substr($value,4,3));
				$present_array[]=array('type'=>'风向变化范围','value'=>$wind_direction);
			}
		if(preg_match($reWindKT,$value,$wind_array))
			{//风
				$unit = $wind_array[4]; //计量单位
				if($unit=="KT")$unit = '节';
				else if($unit=="KMH")$unit='km/h';
				else if($unit=="MPS")$unit='m/s';
				$wind_speed = (int)$wind_array[2].$unit;
				$wind_direction = (int)$wind_array[1];
				if ($wind_array[3]!="")
					{	//阵风
						$wind_speed="阵风".(int)substr($wind_array[3],1,sizeof($wind_array[3])).$unit;
					}
				$present_array[]=array('type'=>'风速','value'=>$wind_speed);
				$present_array[]=array('type'=>'风向','value'=>reWindDirection($wind_direction));
			}
		if(preg_match($reQNHhPa,$value,$QNHhPa))
			{//气压
				$qnhpa = (int)substr($QNHhPa[0],1,4);
				$present_array[] = array('type'=>'气压','value'=>$qnhpa.'hPa');
			}
		if($value=='SCK')$present_array[]=array('type'=>'云层','value'=>'晴空');
		if($value=='NSC')$present_array[]=array('type'=>'云层','value'=>'---');//无特别云层
		if(preg_match($reCloud,$value,$cloud_array))
			{//云
				$cloud_array[]='';
				if($cloud_array[1]=='FEW')$cloud_m='少云';
				if($cloud_array[1]=='SCT')$cloud_m='疏云';
				if($cloud_array[1]=='BKN')$cloud_m='多云';
				if($cloud_array[1]=='OVC')$cloud_m='满天云';
				$cloud_h=(int)(30.48*(int)$cloud_array[2]).'m:';
				if($cloud_array[3]=='CB')$cloud_h=$cloud_h.'积雨云';
				if($cloud_array[3]=='TCU')$cloud_h=$cloud_h.'塔状积云';
				$present_array[]=array('type'=>$cloud_h,'value'=>$cloud_m);//$present_array[]=$cloud_array; //测试用
			}
		if(preg_match($reTempDew,$value,$temp_array))
			{
			if(substr($temp_array[1],0,1)=='M')
				{
					$present_array[]=array('type'=>'温度','value'=>(-1)*(int)substr($temp_array[1],1,2).'℃');
				}
			else
				{
					$present_array[]=array('type'=>'温度','value'=>(int)substr($temp_array[1],0,2).'℃');
				}
			if($temp_array[2]!='')
				{
					if(substr($temp_array[2],0,1)=='M')
					{
						$present_array[]=array('type'=>'露点','value'=>(-1)*(int)substr($temp_array[2],1,2).'℃');
					}
					else
					{
						$present_array[]=array('type'=>'露点','value'=>(int)substr($temp_array[2],0,2).'℃');
					}
				}
			}
	}
return $present_array;
}
function decode_nowcast($nowcast_array)
	{
	$i=0;//计数用
	$publish_time=$nowcast_array['publish_time'].'发布';
	$available_time=$nowcast_array['AvailableTime'].'有效';
	$behind=$publish_time.'<br />'.$available_time;
	$reNowcastType=array('BECMG'=>'天气渐变','TEMPO'=>'短时变化','PROB30'=>'30%概率','PROB40'=>'40%概率','NOSIG'=>'无明显天气变化');
	
	if(array_key_exists(0,$nowcast_array))
		{
			if($nowcast_array[0][0]=='NOSIG')
				{
					$nowcast=array(0=>'NOSIG','publish_time'=>$publish_time,'AvailableTime'=>'2小时内');
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
	$FMATTL_array=array('FM'=>array('自','开始'),'AT'=>array('在 ',''),'TL'=>array('至','为止'));
	if(preg_match($rePublishTime,$raw_time,$time_array))
		{//发布时间,由'180311Z'转为'hh:mm'或'次日hh:mm'
			if((int)$time_array[2]>16)$p_date = (int)($time_array[1]+1);
				else $p_date = (int)$time_array[1];//日期
			$p_hour = ((int)$time_array[2]+8)%24;//小时,从UTC时间转换为8时区时间
			$p_min = $time_array[3];
			$p_time = $p_hour.':'.$p_min;
			$re = array('publish_time'=>$p_time);
		}
	if(preg_match($reTAFAvailableTime,$raw_time,$time_array))
		{//TAF预报期限,由'180606'转为''
			if((int)$time_array[2]>16)$p_date = (int)($time_array[1]+1);
				else $p_date = (int)$time_array[1];//日期
			$fm_hour = ((int)$time_array[2]+8)%24;//起始
			$tw_hour = ((int)$time_array[3]+8)%24;//结束
			if($tw_hour<=$fm_hour)$tw_hour='次日'.$tw_hour;
			$p_time = $fm_hour.':00~'.$tw_hour.':00';
			$re = array('AvailableTime'=>$p_time);
		}
	if(preg_match($reTAFForecastTime,$raw_time,$time_array))
		{//TAF预报时间,由'0002'转为'8:00 ~ 10:00'
			$fm_hour = ((int)$time_array[1]+8)%24;//起始
			$tw_hour = ((int)$time_array[2]+8)%24;//结束
			if($tw_hour<=$fm_hour)$tw_hour='次日'.$tw_hour;
			$p_time = $fm_hour.':00 ~ '.$tw_hour.':00';
			$re = array('ForecastTime'=>$p_time);
		}
	if(preg_match($reFMATTL,$raw_time,$time_array))
		{//METAR预报时间,由'FM0700'转为'自15:00开始'
			$p_hour = ((int)$time_array[2]+8)%24;//小时,从UTC时间转换为8时区时间
			$p_min = $time_array[3];
			$p_time = $p_hour.':'.$p_min;
			$re = array('ForecastTime'=>$FMATTL_array[$time_array[1]][0].$p_time.$FMATTL_array[$time_array[1]][1]);
		}
	return $re;
	}
function reWindDirection($degree)
	{//将风向从角度转为方位,正北向东向西各22.5度范围内为'N'
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
//临近预报输出开始
$metar_array = devide_raw_text(load_metar_text());
$taf_array = devide_raw_text(load_taf_text());
$metar_nowcast = $metar_array['nowcast'];
$taf_nowcast= $taf_array['nowcast'];
$present_metar=decode_weather($metar_array['present']);
$present_taf=decode_weather($taf_array['present']);
$metar_nowcast['publish_time']=$present_metar[0]['publish_time'];
$taf_nowcast['publish_time']=$present_taf[0]['publish_time'];
$metar_nowcast['AvailableTime']='2小时内';
$taf_nowcast['AvailableTime']=$present_taf[1]['AvailableTime'];
print_r(alert_div_formated(decode_nowcast($metar_nowcast)));
print_r(alert_div_formated(decode_nowcast($taf_nowcast)));
//临近预报输出结束
//当前天气状况输出
print_r(present_weather_div_formated($present_metar));
//当前天气状况输出结束
?>
</html>