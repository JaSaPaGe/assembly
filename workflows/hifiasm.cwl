#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool

requirements:
  - class: InlineJavascriptRequirement
  - class: ResourceRequirement
    coresMin: 8
    ramMin: 16000
  - class: DockerRequirement
    dockerPull: "coolmaksat/hifiasm:latest"
  - class: InitialWorkDirRequirement
    listing:
      - entry: $(inputs.data_root)
        writable: true

baseCommand: hifiasm

inputs:
  fastq:
    type: File[]
  ul:
    type: File?
    inputBinding:
      prefix: --ul
  hic1:
    type: File?
    inputBinding:
      prefix: --h1
  hic2:
    type: File?
    inputBinding:
      prefix: --h2
  pat:
    type: File?
    inputBinding:
      prefix: -1
  mat:
    type: File?
    inputBinding:
      prefix: -2    
  threads:
    type: int?
    default: 32
    inputBinding:
      prefix: -t
  output:
    type: string
    default: output.asm
    inputBinding:
      prefix: -o

outputs:
  output:
    type: File
    outputBinding:
      glob: $(inputs.output)

