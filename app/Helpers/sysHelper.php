<?php

function __combo($slug = '', $data = array()){
    extract($data);
    $selected_value = isset($selected_value) && !empty($selected_value) ? $selected_value : '';
    $name = isset($name) && !empty($name) ? $name : '';
    $attributes = isset($attributes) && !empty($attributes) ? $attributes : [];
    $sql_query = isset($sql_query) && !empty($sql_query) ? $sql_query : '';
    if (!empty($slug)) {
        $combodata = DB::table('sys_dropdowns')->where('dropdown_slug', $slug)->first();
        if (!empty($combodata)) {
            $sql = $sql_query == '' ? $combodata->sqltext : $sql_query;
            $query = DB::select($sql);
            $option_data = array();
            $attr = '';
            $attributes = empty($attributes) ? array('class' => 'form-control multi', 'id'=>$combodata->dropdown_name) : $attributes;
            if (!empty($attributes)) {
                foreach ($attributes as $key => $value) {
                    $attr .= $key . '="' . $value . '" ';
                }
            }
            $multiple = isset($multiple) ? $multiple : $combodata->multiple;
            if ($multiple == '1') {
                $attr .= 'multiple = "true"';
            } else {
                $attr .= '';
                $option_data[''] = "Choose Option";
            }
            if (empty($name)) {
                $name = $combodata->dropdown_name;
            }
            foreach ($query as $value) {
                $value_field = $combodata->value_field;
                $option_field = $combodata->option_field;
                $option_data[$value->$value_field] = $value->$option_field;
            }
            return Form::select($name, $option_data, $selected_value, (array)$attr);
        }
    }
}
function fileUpload($filename, $desstination, $request){
    $data = array();
    $desstination = public_path() . '/' . $desstination;
    if ($request->hasfile($filename)) {
        foreach ($request->file($filename) as $file) {
            $name = date('Ymdhis') . $file->getClientOriginalName();
            $file->move($desstination, $name);
            $data[] = $name;
        }
    }
    return implode (", ", $data);
}

function currentDate(){
    return date('Y-m-d');
}
function toDated($date) {
    if (!empty($date)) {
        return date("j M, Y", strtotime($date));
    } else {
        return date("j M, Y", strtotime(currentDate()));
    }
}
function toDateTimed($date) {
    if (!empty($date)) {
        return date("j M, Y h:i A", strtotime($date));
    }else{
        return date("j M, Y h:i A", strtotime(currentDate()));
    }
}

function ordinal($number) {
    $ends = array('th','st','nd','rd','th','th','th','th','th','th');
    if ((($number % 100) >= 11) && (($number%100) <= 13))
        return $number. 'th';
    else
        return $number. $ends[$number % 10];
}

