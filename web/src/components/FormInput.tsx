import classNames from 'classnames';
import {
  FieldValues,
  Path,
  RegisterOptions,
  UseFormRegister,
} from 'react-hook-form';

interface FormInputProps<TFormValues extends FieldValues> {
  name: Path<TFormValues>;
  register: UseFormRegister<TFormValues>;
  rules?: RegisterOptions<TFormValues, Path<TFormValues>>;
  error?: string;
  placeholder?: string;
}

export default function FormInput<TFormValues extends FieldValues>({
  name,
  register,
  rules,
  error,
  placeholder,
}: FormInputProps<TFormValues>) {
  return (
    <div>
      <input
        type="text"
        className={classNames(
          'bg-black rounded-md py-2 px-4 outline-none focus:outline-primary w-full placeholder-primary-100',
          {
            'focus:outline-text-error': !!error,
          }
        )}
        placeholder={placeholder}
        {...register(name, rules)}
      />
      {error && (
        <div className="block text-text-error text-sm mt-2">{error}</div>
      )}
    </div>
  );
}
