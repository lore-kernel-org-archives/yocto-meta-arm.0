Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 237ADC04FFE
	for <webhook@archiver.kernel.org>; Wed,  8 May 2024 15:39:18 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web10.91.1715182754739578135
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 08 May 2024 08:39:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=xDT/R30x;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.173, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-43d2b4d4d3eso16647341cf.2
        for <meta-arm@lists.yoctoproject.org>; Wed, 08 May 2024 08:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1715182753; x=1715787553; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6CWC/8Vc95Rb+dCQlp653zva9Iv1BbDQIQt15g0LhFc=;
        b=xDT/R30x/okj1Bgz9eqBzF9K8CKfiBA9n7kbq6Ea3dOg2RZSbFYs8hSWtgf9vziBEM
         0pXB09ZerO9TKAiYQKGzrquf4xif1UX36OKxpl7qiGIaiht/b8RuRNoDrVrY9cO9LCgB
         EoeV0MUpaGtjdUKl59jhsaSdaojgFbBHNgyuEZPplSh1RZ26qDfEPMb8E9byIdCH2777
         PISq18wcRh5Ot24EAoeQANOTTsOwxCPKtZRzHeJdzmcdc1aMcTrRCc1BOYu/TquHDoXc
         tvyh6eMwrctqtNvn5EwCoHGz/dP/jApMHQ+wlceZdcpGwk7ArJLPiSpfr8LWjy69vcDz
         OPyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715182753; x=1715787553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6CWC/8Vc95Rb+dCQlp653zva9Iv1BbDQIQt15g0LhFc=;
        b=RdofcoEgGPgF14DNulKP+zVwnVhrlGt4x0EquXGEn06eqCv6XLTTnSpAso4aJNNmgd
         eTHEz4ZZcb/lVQVoh+T1WWf0Ds5IKAUiFfroFTE/cbUkG8Tip+iXVYLc6blRN1YYPeY0
         OacUdApVDbHDTKUHcekJbEJoRP9xubfvG4CAGhy+g6MtEcAW9P4H2NKU7eQC69lrbI2S
         RcbxmAdKxrbwjJKVFAzGo5L+4AI3Sm24MlyPTZsjwdA8frWTCd+Eui1jno2JpGbq/L3L
         57Eks6a/w9JkCFbmhZUCYWpu0vAq26Y8vbP507+lEJtDHFCBQbftbOeKelKLSPWNyqXc
         I8aw==
X-Gm-Message-State: AOJu0YwILIuJ3shKbZ5LZ17XDlMvqiZwKBl2CgOtqgSwy2O6RfqG3icE
	40PqtWa0/bBg0+SUVbNc4yQEd76J28Vfn4vw4oLGyh+ntCgJZ2bTnSqevouy3B3PJqBd0P9DTTo
	=
X-Google-Smtp-Source: AGHT+IETdKERtnXbevwKKErBejEtB/6+IIpo86J72aRYQq7S69tpx2H9wE1orS7vRX2Gz9zl8ID8yQ==
X-Received: by 2002:ac8:5748:0:b0:43b:dc5:7b60 with SMTP id d75a77b69052e-43dbf85014fmr35833611cf.44.1715182753489;
        Wed, 08 May 2024 08:39:13 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id ey9-20020a05622a4c0900b00434d86fb403sm4778010qtb.86.2024.05.08.08.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 08:39:13 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/6] arm/gn: update to latest commit
Date: Wed,  8 May 2024 11:38:48 -0400
Message-Id: <171518272945.1632928.689997722372887532.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240507173313.50788-1-jon.mason@arm.com>
References: <20240507173313.50788-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 08 May 2024 15:39:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5709


On Tue, 07 May 2024 13:33:08 -0400, Jon Mason wrote:
> Update to the latest gn commit and remove unnecessary patches and build
> parameters
> 
> Changes in gn between 4bd1a77e67958fb7f6739bd4542641646f264e5d and f284b6b47039a2d7edfcbfc51f52664f82b5a789
> f284b6b47039 [src] Add "#include <limits>" in the //src/base/files/file_enumerator_win.cc
> 155c53952ec2 Get updates to infra/recipes.py from upstream
> d823fd85da3f Revert "Teach gn to handle systems with > 64 processors"
> f07499aebcf5 [apple] Rename the code-signing properties of create_bundle
> 415b3b19e094 Fix a typo in "gn help refs" output
> 93ee9b91423c Revert "[bundle] Use "phony" builtin tool for create_bundle targets"
> cfddfffb7913 [bundle] Use "phony" builtin tool for create_bundle targets
> 06cdcc8e1fa8 [ios] Simplify handling of assets catalog
> 22581fb46c0c [swift] List all outputs as deps of "source_set" stamp file
> 59c4bb920542 [swift] Update `gn check ...` to consider the generated header
> dd0927eb34bb [swift] Set `restat = 1` to swift build rules
> 88e8054aff7b Fix build with gcc12
> e05c0aa00938 [label_matches] Add new functions label_matches(), filter_labels_include() and filter_labels_exclude()
> f19d5817e7ba [swift] Remove problematic use of "stamp" tool
> 6253a39dbc43 Implement new --ninja-outputs-file option.
> 5787e994aa4c Add NinjaOutputsWriter class
> 03d10f1657b4 Move InvokePython() function to its own source file.
> 0cdb7dd27f5c zos: build with -DZOSLIB_OVERRIDE_CLIB to override creat
> d4f94f9a6c25 Enable C++ runtime assertions in debug mode.
> 0a2b8eac80f1 Fix regression in MakeRelativePath()
> 8b973aa51d02 fix: Fix Windows MakeRelativePath.
> a3dcd7a7ad86 Add long path support for windows
> a2e2717ea670 Ensure read_file() files are considered by "gn analyze"
> fc722252439e apply 2to3 to for some Python scripts
> 5110a7f03e86 Add rustflags to desc and help output
> f99e015ac35f strings: support case insensitive check only in StartsWith/EndsWith
> b5adfe5f574d add .git-blame-ignore-revs
> d6085ac6a95b use std::{string,string_view}::{starts_with,ends_with}
> 8bd36a27c076 apply clang-format to all C++ sources
> 5d76868385b8 add forward declaration in rust_values.h
> b8562a4abd95 Add `root_patterns` list to build configuration.
> 5fd939de8a66 Use c++20 in GN build
> d4be45bb28fb update windows sdk to 2024-01-11
> 71305b07d708 update windows sdk
> 85944ebc24a9 Add linux-riscv64.
> 7367b0df0a0a Update OWNERS list.
> 92e63272dc04 remove unused function
> c7b223bfb225 Ignore build warning -Werror=redundant-move
> bc5744174d9e Fix --as=buildfile `gn desc deps` output.
> 9a45b6123831 Update recipe engine to 9dea1246.
> 85bd0a62938b treewide: Fix spelling mistakes
> e4702d740906 Optimize base::EscapeJSONString for ASCII inputs.
> 5d8727f3fbf4 [docs]: Mention implicit names in style guide
> 182a6eb05d15 Use magenta for warnings
> 991530ce394e Avoid unnecessary "Regenerating ninja files" step after running "gn gen"
> c1fc04434c8e Fix variable use tracking for scope subscript accesses.
> cc56a0f98bb3 [infra] Link to jemalloc instead of rpmalloc
> 811d332bd905 Move WriteSourceSetStamp to NinjaCBinaryTargetWriter
> 3fccef9033b9 [action][data deps] Make data-deps order-only deps of the action outputs
> 62ac86a938c3 [action] Add test for data_deps of an action target
> 1029a3b50873 Ninja: Always pass linker flags to rlib-generating command.
> fae280eabe5d [serenity] Add SerenityOS port
> 11e12b0ef870 Remove obsolete comment
> 1de45d1a11cc Generate a StaticLibrary for rlibs and DynamicLibrary for proc macros
> 2a92efd396d3 Include library search paths when compiling rlibs
> da5fe01bce4a Avoid unused and incorrect linker args in {{rustdeps}}
> 
> [...]

Applied, thanks!

[1/6] arm/gn: update to latest commit
      commit: e623cc3b0d337858b582e07aa176956320917325
[2/6] arm-bsp: remove support for n1sdp
      commit: 6db139e1fd7b724c7a5caacb07a4151411be877f
[3/6] arm-bsp: remove unused recipes
      commit: c366c322a715f790e2ea6ce5470d9a7caff2b6c7
[4/6] CI: increase bitbake server timeout
      commit: ac517cbaa3abfe345c1075e4b1e3d0552ce79d72
[5/6] arm/optee: update to 4.2.0
      commit: 6d6fa14744b4e453eedb2c37891259b55557dcbf
[6/6] arm/oeqa: increase optee test timeout
      commit: 6b996c4629f1880d2124ddeefb84e91856e5270d

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

