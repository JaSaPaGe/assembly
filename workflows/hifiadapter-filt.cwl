#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool

requirements:
  - class: InlineJavascriptRequirement
  - class: ResourceRequirement
    coresMin: 8
    ramMin: 16000
  - class: DockerRequirement
    dockerPull: "coolmaksat/hifiadapter-filt:latest"
  - class: InitialWorkDirRequirement
    listing:
      - entry: $(inputs.data_root)
        writable: true

baseCommand: pbadapterfilt.sh

inputs:
  fastq:
    type: File
    inputBinding:
      prefix: -p
  threads:
    type: int
    default: 8
    inputBinding:
      prefix: -t
  min_adapter_len:
    type: int
    default: 44
    inputBinding:
      prefix: -l
  min_match_percent:
    type: int
    default: 97
    inputBinding:
      prefix: -m
  output:
    type: string?
    default: output.filt.fastq.gz
    inputBinding:
      prefix: -o

outputs:
  output:
    type: File
    outputBinding:
      glob: $(inputs.output)

