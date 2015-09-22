json.array!(@student_registers) do |student_register|
  json.extract! student_register, :id, :student_id, :section_id, :tution_fees, :exam_fees, :register_date, :complete_tf, :complete_ef, :staff_id, :remark
  json.url student_register_url(student_register, format: :json)
end
