import { ComponentType } from 'react';
import classNames from 'classnames';

interface ButtonProps {
  type?: 'button' | 'submit';
  icon?: ComponentType;
  text: string;
  isFullWidth?: boolean;
  isLoading?: boolean;
  onClick?: () => void;
}

export default function Button({
  type = 'button',
  text,
  icon: Icon,
  isFullWidth = false,
  isLoading = false,
  onClick,
}: ButtonProps) {
  return (
    <button
      className={classNames(
        'bg-primary-700 text-primary-400 hover:opacity-90 rounded-xl h-10 font-medium flex justify-center items-center space-x-2',
        {
          'w-full': isFullWidth,
        }
      )}
      type={type}
      onClick={onClick}
    >
      {isLoading ? (
        <div className="loading-dot-flashing"></div>
      ) : (
        <>
          {Icon && <Icon />} <span>{text}</span>
        </>
      )}
    </button>
  );
}
