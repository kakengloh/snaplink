import { ComponentType } from 'react';
import classNames from 'classnames';

interface ButtonProps {
  type?: 'button' | 'submit';
  icon?: ComponentType;
  text: string;
  isFullWidth?: boolean;
  onClick?: () => void;
}

export default function Button({
  type = 'button',
  text,
  icon: Icon,
  isFullWidth = false,
  onClick,
}: ButtonProps) {
  return (
    <button
      className={classNames(
        'bg-primary-700 text-primary-400 hover:opacity-90 rounded-xl py-2 font-medium flex justify-center items-center space-x-2',
        {
          'w-full': isFullWidth,
        }
      )}
      type={type}
      onClick={onClick}
    >
      {Icon && <Icon />} <span>{text}</span>
    </button>
  );
}
