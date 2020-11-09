module MicroQiskit
  ( QuantumCircuit
  , initialize
  , x
  , z
  , y
  , h
  , rx
  , ry
  , rz
  , cx
  -- , measure
  -- , simulate
  )
where

data Gate = Fixed String Int | Rotational String Float Int | Two String Int Int
          deriving (Show)
data QuantumCircuit = QuantumCircuit { num_qubits :: Int
                                     , num_cbits :: Int
                                     , data' :: [Gate]
                                     } deriving (Show)

-- Initialize the quantum circuit in to the given state.
initialize :: QuantumCircuit -> [Gate] -> QuantumCircuit
initialize circ state = QuantumCircuit m n state
 where
  m = num_qubits circ
  n = num_cbits circ


-- Add gates
addGate :: QuantumCircuit -> Gate -> QuantumCircuit
addGate circ gate = QuantumCircuit m n (d ++ [gate])
 where
  m = num_qubits circ
  n = num_cbits circ
  d = data' circ

-- X gate
x :: QuantumCircuit -> Int -> QuantumCircuit
x circ q = addGate circ (Fixed "x" q)

-- Y gate
y :: QuantumCircuit -> Int -> QuantumCircuit
y circ q = addGate circ (Fixed "y" q)

-- X gate
z :: QuantumCircuit -> Int -> QuantumCircuit
z circ q = addGate circ (Fixed "z" q)

-- H gate
h :: QuantumCircuit -> Int -> QuantumCircuit
h circ q = addGate circ (Fixed "h" q)

-- RX gate
rx :: QuantumCircuit -> Float -> Int -> QuantumCircuit
rx circ theta q = addGate circ (Rotational "rx" theta q)

-- RY gate
ry :: QuantumCircuit -> Float -> Int -> QuantumCircuit
ry circ theta q = addGate circ (Rotational "ry" theta q)

-- RZ gate
rz :: QuantumCircuit -> Float -> Int -> QuantumCircuit
rz circ theta q = addGate circ (Rotational "rz" theta q)

-- CX gate
cx :: QuantumCircuit -> Int -> Int -> QuantumCircuit
cx circ control target = addGate circ (Two "cx" control target)
