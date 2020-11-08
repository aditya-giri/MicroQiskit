module MicroQiskit
  ( QuantumCircuit
  , initialize
  , x
  , rx
  , h
  , cx
  , rz
  , ry
  , z
  , y
  , measure
  , simulate
  )
where

data QuantumCircuit = QuantumCircuit Int Int

initialize :: Int -> Int -> QuantumCircuit
initialize qbits clbits = QuantumCircuit qbits clbits
