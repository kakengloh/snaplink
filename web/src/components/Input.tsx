interface InputProps {
  value?: string;
  onChange?: (value: string) => void;
  placeholder?: string;
}

export default function Input({ value, onChange, placeholder }: InputProps) {
  return (
    <input
      type="text"
      value={value}
      onChange={(e) => onChange?.(e.target.value)}
      className="bg-black rounded-md py-2 px-4 outline-none focus:outline-primary w-full placeholder-primary-100"
      placeholder={placeholder}
    />
  );
}
