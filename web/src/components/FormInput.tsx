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
          'w-full rounded-md bg-black py-2 px-4 placeholder-primary-100 outline-none focus:outline-primary',
          {
            'focus:outline-text-error': !!error,
          },
        )}
        placeholder={placeholder}
        {...register(name, rules)}
      />
      {error && (
        <div className="mt-2 block text-sm text-text-error">{error}</div>
      )}
    </div>
  );
}
