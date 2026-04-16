
'use client';

import { useAccount, useConnect, useDisconnect } from 'wagmi';
import { injected } from 'wagmi/connectors';

export default function ConnectWallet() {
  const { address, isConnected } = useAccount();
  const { connect } = useConnect();
  const { disconnect } = useDisconnect();

  return (
    <div className="flex items-center gap-4">
      {isConnected ? (
        <>
          <span className="text-sm text-zinc-400">
            Connected: {address?.slice(0, 6)}...{address?.slice(-4)}
          </span>
          <button
            onClick={() => disconnect()}
            className="px-6 py-2 bg-red-600 hover:bg-red-700 rounded-lg"
          >
            Disconnect
          </button>
        </>
      ) : (
        <button
          onClick={() => connect({ connector: injected() })}
          className="px-8 py-3 bg-white text-black font-medium rounded-lg hover:bg-zinc-200"
        >
          Connect Wallet
        </button>
      )}
    </div>
  );
}
