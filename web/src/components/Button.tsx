import { ComponentType } from 'react';
import classNames from 'classnames';

interface ButtonProps {
  icon?: ComponentType;
  text: string;
  isFullWidth?: boolean;
  onClick?: () => void;
}

export default function Button({
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
      onClick={onClick}
    >
      {Icon && <Icon />} <span>{text}</span>
    </button>
  );
}
