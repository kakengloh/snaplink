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
        'flex h-10 items-center justify-center space-x-2 rounded-xl bg-primary-700 font-medium text-primary-400 hover:opacity-90',
        {
          'w-full': isFullWidth,
        },
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
