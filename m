Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25760C282C5
	for <webhook@archiver.kernel.org>; Fri, 28 Feb 2025 04:02:36 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web10.8469.1740715346480080482
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 27 Feb 2025 20:02:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=yScOIQ8p;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.181, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7be6fdeee35so319498485a.1
        for <meta-arm@lists.yoctoproject.org>; Thu, 27 Feb 2025 20:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1740715345; x=1741320145; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L0YdwWS3XfZOzdrK1ZXqDkU9msUiRXVqKWnZOEj6uls=;
        b=yScOIQ8pRGELcA6O2TAdrL2Q6w60GsfD47Ubl1xiovLdHv5cbunVUKW3lxn6IobsoV
         PgGQb2Ijzu7mO9QWLdwtHTEqRNvtzLYq1zJHHijcl+syHuH9jUaWTr+QzoNJU8XzQbEi
         QYAp7t6BKVHkh+I9q3VFECttIywdMiUV6u3wVeykuNfSDQLnSkDLTcR3HOcp/a2mhySy
         WQNxNOjyNRH4GRxTy2D5Lxm3esH5ZaIs3v5YPzK86AbvamCMXqp+f4ybdf1l7chq92wy
         dsz3SOMMBcYxcFnmwzLVFuaYQS6OOVI1s+c0ml06M/yLp5bnwuJnPjsQsqKm0+O/Hc40
         X1RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740715345; x=1741320145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L0YdwWS3XfZOzdrK1ZXqDkU9msUiRXVqKWnZOEj6uls=;
        b=OlJiKVw7yWzmBAA71kps9SVA7jvp367hpOGr0JOnNwH9SoY2MAq/CXTAtT3Y09BmCn
         nN9Qgoy9H83zybf3yDqgb2q8tVbIG1jrXP0MgVKWntgrEXJMDfAv45DimfdGU3EviJ3P
         qhmoOACGweqXfaBegndhzI6q5akpI1eu5WiZBRWqkhIMZQbwcI254dFs+Sb735AyGhvH
         CtmvV5NYA7HwQG7HmDg2JJd8Ytuzlh1gKaSiUvq5da+1EDitvgr9J9UfxEhVn7H0Oz7N
         pWAR4Jzfqd67OrvY0XonBbJCW6rG6q96ECOuNTLxq8uxh3OadwsC6w5UiCeT6OPocSBe
         ZAfA==
X-Gm-Message-State: AOJu0YwXYUZVTJiRPDBICbK6AEaJgSQKbwl7owtmMFgl3CT1Mj4T4vMs
	HuYs2hIoejkYSeRJ1yeIZp8NUorioAErNHvFwrrk/CA15Kvs5PKcxWH/ZnVhL9Lv/Cg9Uiz4XNE
	=
X-Gm-Gg: ASbGncuTGYhJlx2g+lq4ntF8QxuclPfimSsgCuWMNdbluMW6Yy1ZSwg5yel0ABi0x+E
	3DzBJCCVXT2CuxxewdtOYdEeDpDNj8QjBYtKriSQZH1Wlozp/dbpzvPxpSRCUo+Hzk3ic4gfBhu
	UHd0kucTn9RSzdDA/t5N1jeen3vDAmArv1UY2Via/tXKhjJNMpOj1ahfPb/dpzq8qJzw2NIAg72
	d81Ja0fhb8OeWHQo3q3rC1Khhd9M2xDAie+MOCDp31X1Dypk10rXbonn6fDvjEeA0em0ZIuvaPx
	94omlFLr4OlqgFJWTA==
X-Google-Smtp-Source: AGHT+IEvs/5xGQBMHOCcJcsiZqgw7lYYRu/jVhZCHhYiqwkdL18zPxDKwdliGePlBeZ0iiq93ZL7zQ==
X-Received: by 2002:a05:620a:3916:b0:7c2:49a6:86e1 with SMTP id af79cd13be357-7c39c62ee5dmr317951785a.40.1740715345226;
        Thu, 27 Feb 2025 20:02:25 -0800 (PST)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c397839e3esm122005285a.20.2025.02.27.20.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 20:02:24 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/7] arm/hafnium: update to v2.12.0
Date: Thu, 27 Feb 2025 23:02:16 -0500
Message-Id: <174071533789.3689039.6635674825098016842.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250225151817.11875-1-jon.mason@arm.com>
References: <20250225151817.11875-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 28 Feb 2025 04:02:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6393


On Tue, 25 Feb 2025 10:18:11 -0500, Jon Mason wrote:
> Update to the latest version of halfnium
> 
> Changes between 2bef7ab3895c48d39b84ab58179b2d0de5156b8b and 2cf2ca7c4b81ab18e9cd363d9a5c8288e2a94fda
> 	2cf2ca7c4b81 docs: the change log for the v2.12 release
> 	69e18eb52d63 docs: update the threat model for IPI threats
> 	c9866ab33c7a docs: add description of single service IPI support
> 	b17856caec30 test: interrupt targeting blocked vcpu is queued
> 	0ee13d9cc510 test: add helpers to share page for coordination btw endpoints
> 	eda971da9f4c fix: queue interrupt targeting blocked vcpu
> 	0a69718c6298 fix(docs): fixes to the docs to fix build errors
> 	4b3d26803b56 test(ipi): IPI to invalid vCPU fails
> 	2f579f93c1d9 test: multiple SPs periodic deadlines on multiple cores
> 	8157b6897a8f test: multiple SPs with periodic deadline
> 	b390a0d12967 test(ipi): set target vCPU in VCPU_STATE_BLOCKED
> 	2affbc7a7bbb test(ipi): target vCPU set in VCPU_STATE_PREEMPTED
> 	180a65a7be5f feat(ipi): handle in VCPU_STATE_BLOCKED/PREEMPTED
> 	84d49b67d2d9 fix(ipi): small fixes to the ipi implementation
> 	0136b2bf3f35 test: migrate blocked vcpu with pending timer
> 	da42b544504b test: timer expired while vcpu is in PREEMPTED state
> 	7c9702280c62 chore: reduce verbosity of console messages for SPs
> 	9243e772b209 docs: support for arch timer in secure world
> 	c0110997e1f8 chore: add doc comment on Pauth fault tests
> 	a067dc1d77f8 test: add unit tests for timer management
> 	872742eec217 test: use watchdog timer as source of non secure interrupt
> 	febcb625856e test: add driver for normal world watchdog timer
> 	b9dd51451e46 test: introduce driver for sp805 peripheral
> 	65827d703535 test: migrate vCPU of SP with pending timer deadline
> 	593b8addcbdc test: multiple SPs programmed with timer deadlines
> 	fe10878b1e1c test: SP reprograms the arch timer deadline
> 	b2429b49c524 test: SP handles timer with short deadline
> 	34c050a04357 test: commands for SP services to configure timer
> 	64ae5a8d6a18 test: add SP helper utilities for arch timer
> 	6b8cf4f361f6 feat(arch timer): handle spurious host timer interrupt
> 	106bfc364d64 feat(arch timer): migrate vCPU with pending timer to another CPU
> 	cf069a65988e feat(arch timer): resume SP if deadline expires in NWd
> 	2efb3e103382 feat(arch timer): handle host timer interrupt tracking live deadline
> 	32424db1d5d6 feat(arch timer): inject timer virtual interrupt before resuming vCPU
> 	a3787c91a96c feat(arch timer): track pending timer configured by SP vCPU
> 	28e988f3bb56 chore: exclude physical timer source file from static checks
> 	f684d196422b feat(arch timer): trap and emulate physical timer access from SPs
> 	d3ac7383c10f feat(arch timer): helpers to configure EL1 physical timer
> 	f658f5e1a6e1 feat(arch timer): initialize timer list and host physical timer
> 	def48d0365b3 feat(arch timer): introduce host timer driver
> 	c31708afa85c feat(arch timer): helper utilities to add and remove from timer list
> 	eed861e514ba feat(arch timer): data structure to track pending timers
> 	08200fe0f2e2 test: physical interrupt preempts virtual interrupt handling
> 	75331b3ee028 test: SPMC call chain not preemptible
> 	179f567f17fe test: helpers commands to mimic secure interrupt scenarios
> 	94946a1451e3 fix(interrupts): SPMC scheduled call chain shall not be preempted
> 	025a451a9275 fix: simplify secure interrupt handling
> 	c3fd9756a53e feat(memory share): handle GPF in FFA_MEM_FRAG_RX
> 	e06384d55458 docs: document VM availability messages
> 	50ef91174b38 refactor: api_ffa_msg_send_direct_resp
> 	13f09815b474 refactor: don't pass sender/receiver ID
> 	79504ff11a86 refactor: remove unused functions
> 	a1a0235181b3 test: VM availability messaging tests
> 	06e8b732abc2 feat: forward VM availability messages from SPMC to SP
> 	d0356f85a2a2 refactor: `spmd_handler` refactorings
> 	520bcc86451b test: VM created/destroyed partition properties
> 	a603e0842531 feat: VM created/destroyed partition properties
> 	18694027d10d feat: parse `vm-availability-messages`
> 	1308a63f4851 test(ipi): FFA_NOTIFICATION_INFO_GET reports pending IPI
> 	d270b869c989 test(ipi): target waiting vCPU whilst in SWd
> 	537165559733 test(ipi): target waiting vCPU whilst in NWd
> 	3a9510e81960 test(ipi): handling SRI in the NWd
> 	377defd58730 test(ipi): send IPI to running vCPU
> 	d2efb134495d test(ipi): state machine to help testing IPI
> 	8be2651ff463 test(ipi): add unit tests for fetching pending IPIs
> 	1f2babf02fd8 feat(ipi): report IPIs in FFA_NOTIFICATION_INFO_GET
> 	960be20fecdc feat(ipi): handle IPI for waiting case
> 	f3cf28cf7d4b feat(ipi): introduce IPI paravirtualised interface
> 	18485946304c refactor: use bitfields for interrupt_descriptor struct
> 	e44e18e5702b fix: increase stack size in primary VM
> 	cc9d11383413 ci: increase timeout for long running tests
> 	b8f9a899f0be test: if SPs wake up with eret FFA_RUN
> 	4dbf4d95c63f fix: only normal world VMs need FFA_RUN
> 	478faac95b69 refactor: always eret FFA_RUN to the caller
> 	8ddb0e2d11e6 chore: drop the FFA_RUN tests
> 	3190f5401e09 chore: specify updated submodule commit hash
> 	baaf9e5bd0c5 docs: update FFA_PARTITION_INFO_GET(_REGS)
> 	0ffce75f8244 refactor(notifications): verbose validity check
> 	3e55c4d8e3de fix: check ff-a version for functionality support
> 	d96c931b233d test(ff-a): report features in partition info get
> 	7fb0fdb7ab97 fix: report indirect message and direct message 2
> 	11f50e5ff10b chore: drop linux/driver project checks
> 	d5d6c381e69c chore: drop the driver/linux submodule
> 	8018929656f3 doc: refer the checkpatch.pl setup
> 	d8e61447a1b5 ci: add script download checkpatch.pl
> 	94b0fa111104 chore: drop rule to update linux binary
> 	ddeedafa09d0 chore: drop the third_party/linux submodule
> 	6b756a10770a ci: drop the setup with the hafnium driver
> 	15e302616540 chore: drop hf_interrupt_inject
> 	da6b099e5dfb chore: drop mailbox waiting list
> 	9a9ed227a137 test(ff-a): FFA_MSG_WAIT called with pending message
> 	ccbf26c078c7 docs: add FFA_MSG_WAIT description
> 	ea8ccfe752cb refactor(notifications): drop the SRI state
> 	ac0cb263714c chore: drop legacy timer support in hypervisor
> 	9acc62973951 chore: remove legacy timer support tests
> 	a74c97c4c184 test: interrupt targets blocked SP
> 	23a7e58b6494 fix(interrupts): resume blocked vCPU and pend vIRQ line
> 	3e749afb2d9b test(pauth): test PAuth usage from S-EL0
> 	70c6ca0e0cb9 fix(pauth): use prng to generate S-EL0 pauth keys
> 	9478e32bb811 refactor: UUID packing/unpacking
> 	cca64d765bf0 refactor: `get_ffa_partition_info`
> 	fb9c2a27a319 refactor: `api_ffa_fill_partition_info`
> 	45abeebfd2b4 feat: report error if too many UUIDs in manifest
> 	6053297ef775 refactor(manifest): UUID parsing
> 	8c5de22b6b6a test: fork 'preempted_by_secure_interrupt'
> 	bd32c97bdb07 refactor: simplify interception of FF-A calls
> 	67f5ba3d10d3 refactor: boot order list to use list.h
> 	8e02186908e0 refactor: rename list functions
> 	3bfc36eab652 test(ff-a): cannot send indirect message when RX buffer full
> 	3d5a9609bf43 test(ff-a): add RX retention tests to S-EL0 setup
> 	a2103eb08381 feat(code-coverage): check elf files for folder include/exclude
> 	c7270b752e5f fix(memory share): hypervisor retrieve request check
> 	7640451f68fc fix(build): fix out of tree build specifying $OUT
> 	36fcf881497b fix: detect pauth algorithm in cpu
> 	483686441714 refactor: `memcpy` refactors
> 	5d5f27972dbb fix: use correct load-address while adding offset
> 	3bb825946fed fix(indirect message): set framework notifications
> 	8ccd2d0f0552 fix: rename load address relative offset node name
> 	67196c7ad3bc docs: document new `FFA_VERSION` behaviour
> 	c4d9ae80b40b fix(ff-a): don't report ME interrupt to EL0
> 	41c5da385103 fix(notifications): delay SRI flag use from NWd
> 	d9e7c8fd3cf9 fix: in case the mailbox is FULL return FFA_RUN
> 	77b4eef0071d fix(hftest): clear NPI when polling for notifications
> 	486ffdce7223 test(ff-a): FFA_MSG_WAIT multicore RX buffer test
> 	337dbdfa04ee test(ff-a): test FFA_MSG_WAIT with retain RX buffer flag
> 	7253bd5c43fc feat(ff-a): add retain RX buffer flag to ffa_msg_wait
> 	bc854180a4bb test(ff-a): verify FFA_MSG_WAIT releases RX buffer
> 	be1a0b7a4d43 fix(ffa): add RX buffer release to FFA_MSG_WAIT
> 	b8730e9f7263 refactor: moved api_interrupt_clear_decrement to vcpu
> 	cfc8174a3a22 refactor: added ffa_msg_wait_complete
> 	472f66a344c9 refactor: use vm_id_is_current_world
> 	ac9407556eca refactor: rename implicit_completion_signal
> 	3b31f09c4e80 refactor: create vcpu_secure_interrupt_complete
> 	9a4b9c0b9592 fix(notifications): per-vCPU for MP only
> 	318e90a733de feat: queue interrupt targeting blocked vcpu
> 	c023e39839c0 test: new setup with S-EL1 UP SP as Service2
> 	538b688a0865 test: register secondary entrypoint only for MP S-EL1
> 	ec3bf2223df0 test: queue interrupt targeting a migrated vcpu in blocked state
> 	97fa216c6ae9 test: queue interrupt targeting a migrated vcpu in running state
> 	ce6baae61eee test: queue interrupt targeting a migrated vcpu in waiting state
> 	4fff340ea012 test: queue multiple pending virtual interrupts
> 	e1bec84e69f1 test: handle secure interrupt triggered by Generic Timer
> 	95bb8fe60145 test: leverage build define to identify an S-EL0 SP
> 	75a1ab7b9c3c test: update manifests to accommodate AP REFCLK timer device region
> 	76fe642c630f test: add SP helper commands to manage generic timer
> 	ad3fb6698931 test: add driver for AP REFCLK Generic timer
> 	92b404ecffd6 test: driver for generic memory mapped system timer
> 	ae519e184f12 test: map MMIO regions from device region nodes
> 	7945bb578a0f refactor: reduce fields tracking interrupt handling for vcpus
> 	93d3d7015108 feat(interrupts): target migratable S-EL1 UP vCPU
> 	42e56c11d90e feat(interrupts): target migratable S-EL0 UP vCPU
> 	48dc41c3890c feat(interrupts): queue if unable to signal virtual interrupt
> 	c64d0645a4c4 feat(interrupts): prioritize servicing queued virtual interrupts
> 	32913cb081cf feat(interrupts): data structures, helpers for queueing
> 	b7c2558e1bbd fix(interrupts): drop the running priority before resuming vcpu
> 	6acc53703857 fix(hftest): logs from different setups would override
> 	ff651e335032 feat: hftest to disable_visualisation
> 	6f6bf8a117f9 refactor: simplify functions to pend VI
> 	33172403a44a fix: moved unsupported function log
> 	3e9f605eba42 test: interrupt to be pended before boot
> 	cc542042dbbd feat(interrupts): physical interrupt enabled
> 	d533859d7826 chore: add venv to gitignore
> 	1c56a252a966 fix(hftest): service set-up functions in core 0
> 	65deaa433730 refactor: drop hypervisor-specific tests
> 	6045881f4fe2 fix(notifications): vCPU ID check in get ABI
> 	a2c79226b56b docs: redirect to a common ff-a binding document in TF-A
> 	296ee70c7af7 refactor(memory share): split check of hyp retrieve request
> 	058ddee34d02 fix: remove memory region's device attribute
> 	71704804400a secure_tc: enable branch protection
> 	9c5b1d3708f8 refactor: split `api_ffa_features`
> 	650cb148d610 refactor: report FFA_YIELD
> 	1a8c0cdb812c refactor: report secondary EP register supported
> 	5a222641c137 refactor: permission get/set supported at S-EL0 partitions
> 	4271ff9734fe refactor: remove arch/platform specific ffa_features
> 	4e8e479805bb refactor: reduce log level of some log statements
> 	be12343e0ceb fix(hftest): interrupt enable/disable
> 	94f9a7303d06 fix(docs): refactor poetry dependency group
> 	734981e83008 fix(memory share): dont change the PAS for device memory
> 	9a444adfee0b refactor(hftest): update iris options
> 	fd374b8c9227 fix(memory share): v1.1 emad reserved field check
> 	5ebf4bf2c364 feat: parallelize `clang-tidy`
> 	2ad6b66ef5f6 chore: fix `clang-tidy` warnings
> 	a4d4a2b00cf2 fix: check `.h` files with `clang-tidy`
> 	20acb0118db9 refactor: remove `make check`
> 	ca9234c8510c refactor: reformat `.clang-tidy`
> 	67a7926ce341 fix: first vCPU runs in the VCPU_STATE_RUNNING
> 	77f39c21e52a fix(docs): point poetry readthedocs virtual env
> 	bd43209c3d7f refactor: console log verbosity
> 	052fa62be451 fix(docs): design doc typo fails the build
> 	a33eca997600 fix(qemu): memory barriers to operate DMA
> 	66a38bd5184d fix: fix build with clang-18
> 	a5ea909bfc61 fix: fix build with clang-17
> 	74ee3ab8bb56 fix: fix build with clang-16
> 	6f1f1210152d feat: print vCPU ID
> 	920362870c0d test: tests for printing sequentially and concurrently
> 	31e5c95fd1c7 fix(hftest): define stacks for all secondary cores
> 	7cdb36d7dfa8 test(mem share): RO mem cannot be zeroed during send
> 	72d53a15d7b7 fix(boot): remove limit all partition memory is RW
> 	c7a3848c7cc0 refactor: improve hftest error message
> 	133ae6e2e48b feat(dlog): adopt FF-A in `stdout_putchar`
> 	c5cebbc0e8d0 refactor: move log buffer from VM to vCPU
> 	99fe2434f9d9 refactor: add documentation for interrupt controller in DT
> 	1c26ae7ec65a fix(gic): add support for passing GIC data from DT in boot flow
> 	99c5eff25b84 test: add unit tests to validate dma properties
> 	718afa9ca629 refactor: create a helper function to obtain common fields
> 	9c764b3e5437 refactor: use dma device properties struct within device node
> 	7de26958d155 refactor: extract VM's log buffer into separate struct
> 	6027b4f0bd7a fix: fix signature of `memcpy`
> 	8f046e4873ea refactor: remove `CHECK_OR_ZERO` macro from `std.h`
> 	2b56fc163c19 refactor: replace some uses of `uintptr_t` with `cpu_id_t`
> 	b4ef4320e1d0 refactor: use typedef for CPU entry point functions
> 	71d887b7cad0 refactor(memory share): improve naming of sender_orig_mode
> 	c8e6e85d7f72 test(memory share): device as normal through descritor mem types
> 	3b65a25f2642 test(memory share): lend device memory as normal
> 	6e2613628196 fix(memory share): add precedence check for memory type
> 	2268412d6968 test(memory share): normal memory lent as device
> 	91052c3eb749 fix(memory share): log for invalid instruction access
> 	3f295b18c75c feat(manifest): add overlap checks for SPMC memory
> 	889cbf1e6e82 refactor: use enums for PSCI constants
> 	5e99699970bc refactor: add helper function to check if VM is primary
> 	8204182ee3d2 refactor: add helper functions for checking if VM is UP/MP
> 	0a824e972474 chore: fix log strings
> 	bd060340445e fix(memory share): relinquish from VM
> 	9bbcb87d8873 fix(memory share): assert pointer before dereferencing
> 	a39a84497eda feat(memory share): relinquish use `memcpy_trapped`
> 	3f6527cd56f9 feat(memory share): revert memory retrieve
> 	69cdfd9531f8 feat(memory share): avoid updating PTs
> 	7b9cc432ce38 feat(memory share): memcpy_trapped to copy retrieve resp
> 	8f2150d1d4c6 feat(memory share): `memcpy_trapped` to read from tx
> 	f220d57a4102 fix(memory share): retrieve request validation
> 	c9227c849e62 fix(memory share): multiple borrower with NWd VM
> 	540cddfcb118 feat: introduce gicd_set_ctrl helper utility
> 	cde596402559 test(ff-a): add tests for changing version through `FFA_VERSION`
> 	64d930ee6c33 fix: check that calls to FFA_VERSION actually succeed
> 	e9921275a326 fix: memory sharing tests
> 	08befddc43c0 refactor: move `update_mm_security_state` to `common/ffa.c`
> 	2909e54cf230 refactor: port tests due to new restrictions
> 	d319fbbb5b9b fix: remove log statement that caused `FFA_VERSION` to fail
> 	6eeec8e85a5f feat: restrict `FFA_VERSION` calls
> 	0e617d9d2245 refactor(ff-a): `FFA_VERSION` related refactorings
> 	4b846eb871c0 fix(mem share): zeroing RO memory during memory send
> 	8fc1b5054cb2 fix: error codes need to be uint32_t
> 	6fd6c1d6ecad fix: fix input validation in FFA_FEATURES
> 	49ec1e42e218 refactor: refactor `api_ffa_features`
> 	88851f90b88e feat: add macros to check bits
> 	d1c34b5edee1 feat(mte): add error log for sync tag fault in EL2
> 	95fbb31760eb feat(memory share): add memory share 64-bit ABIs
> 	b9ae416a7d55 refactor: use `GET_ESR_EC` macro
> 	5a13355b0802 refactor: add `GET_ESR_FNV`
> 	9f7ce018c967 test(dlog): unit tests for `dlog` with binary format specifier
> 	7efc8377234e feat(dlog): support binary unsigned integer format specifiers
> 	e8937d9c2a05 chore(dlog): fix uses of `dlog` to use new format strings
> 	544549064bb2 feat(dlog): check arguments to `dlog` at compile-time
> 	50af30574657 test(dlog): unit tests for `dlog` with length modifiers
> 	70894da99ab1 feat(dlog): handle length modifiers
> 	e980e611ed8a refactor(dlog): miscellaneous changes related to logging
> 	705b56e94b38 refactor(dlog): move `dlog_flush_buffer` to `api.c`
> 	e8fdaed4c376 refactor(dlog): replace macros with enums
> 	93157d09e78f test(dlog): unit tests for `dlog`
> 	c9df08b45438 feat(hftest): assertion macros for strings
> 	d2ef618a680c refactor(dlog): return number of characters written
> 	222d9fbb3dee fix: enable `-Wsign-compare` in `ASSERT_EQ`
> 	1064a9c8d3c3 refactor: use `enum ffa_error` for errors
> 	824b63d9b256 feat: enable `-Wsign-compare`
> 	b090762d1c4d fix: disable `-Wsign-compare` for dtc
> 	4a88b9625897 feat: enable `-Wextra` flag
> 	df099becb672 refactor(init): use memory pool for boot params
> 	dc759f53ddbe refactor: use an enum for FF-A error codes
> 	d38270c14fe8 refactor: use enum for SP commands
> 	6a7c95926233 feat(hftest): rewrite error messages for failed assertions
> 	76766e61e230 refactor: use `typeof` in `HFTEST_ASSERT_OP`
> 	871b41e33565 refactor: always expand `assert` macro
> 	3a3e08dbd653 fix: check for illegal values of gic related build flags
> 	346a09cfce7f fix: check for illegal branch protection feature
> 	0549849def41 fix: propagate enable_mte build flag to cflags
> 	00d3b632aeda fix: incorrect calculation for number of boot info desc
> 	b886d4930571 fix(memory share): drop check to instruction access
> 
> [...]

Applied, thanks!

[1/7] arm/hafnium: update to v2.12.0
      commit: f1fc5c53a1136ea76983899241d1a3b4102018cb
[2/7] arm/opencsd: update to 1.5.5
      commit: 543adf67d2cb6be11950c78dd395b5b17ac45614
[3/7] arm/gn: update to latest commit
      commit: 74bd36ec63f3e2b8cc88733bda6ba3659f77cae8
[4/7] arm/trusted-firmware-a: update the LTS to v2.10.12
      commit: 55b41af673f4f1512f8ad2b20bbe2bd0cd9dcac4
[5/7] arm/trusted-firmware-m: update to v2.1.1
      commit: b31af92555810dac69d82f59931a12e6947f80ef
[6/7] arm/trusted-firmware-rmm: update to 0.6.0
      commit: 9da0a47d07f088fefc4afafa9d28ef69a039646e
[7/7] arm/boot-wrapper-aarch64: update to the latest
      commit: 07fcd92a68300a9b6d0d04b33d07b25b371759b9

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

