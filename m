Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09286D3B7E2
	for <webhook@archiver.kernel.org>; Mon,  8 Dec 2025 16:24:33 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.883.1765211067698382653
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 08 Dec 2025 08:24:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=T30yUxfj;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.53, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-882360ca0e2so35914426d6.0
        for <meta-arm@lists.yoctoproject.org>; Mon, 08 Dec 2025 08:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1765211066; x=1765815866; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J9QmDwO8lG3IXFCJAZNDBE/2ob7rSPjAcDkyNfTq5IY=;
        b=T30yUxfjKrBGAOMuQxwRd6YmoMXltIq5VRo6NEls3tY+XsAT5ZazuD1WMLXEYciFBr
         k54hEy6WMeVTZvnMW8E02/3R0DgsTPoL67fasqvcsBCeHgu7QCI6Bre6gDP+Ih8sYUX3
         zJB3VjbPE9ZB6YcMR6p9+GaG97JbvGSFvTLpOrDIHjC4JfB5KG9XqDpbeCW33zDu3+FL
         IMlWd72SnSYoVaPxxwPp7nWkJzV2UYknP1CP4tXmtbCSSuqNFEDPmtXKNm+svDV5mGuO
         8drDp+vxTgCA71X6Tq+rzY+zXNMRbCwy4pD6y7h8Xef66Iotf04iYFbWLeWjbMf1tLIx
         cSyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765211066; x=1765815866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J9QmDwO8lG3IXFCJAZNDBE/2ob7rSPjAcDkyNfTq5IY=;
        b=Cls5+6OZjFkqJvOff+Ndz4qOvC6ea5VxlyyCkPh1x3UDNksdGfrj83PFZXBdjFPCcS
         Sdt+zOeIQfeVxWTG9qakCIp6hw3x8+syGIqNTKdXYuGaD03ROwuVqjpDiwxBT1fJl9vm
         J0Fuco2QR6A/inpidUy/E+IU2jjpDulYlxYMoU0OeVsFeKEaxCJRlZF9L74wqgwdNGnA
         G7LWnsNyARetxVF4hPEordgqPS5WF9YWGBV9hRMB7m4K7E1bbOjWXeCtLTSO70OLMg21
         4VYgjZVi/UVbbXtkSwyy2pGBeabJ0CGvVf+U0X1gqiFvSm/ENio+tu2dhOf7i1fI6RBk
         +/Jg==
X-Gm-Message-State: AOJu0YwJ+Dp6Jgb/G89rqMke2pRRCydCvHvhj+5uXZIV6S2z7n7dUnLt
	kpHwwahn2Pt4IupD8xxWT8/QPV+jns7CrKMiavUnUoj6Q0DuMlhDaosUyzlF62Ol4oryYfKXec9
	NVNj2CQ==
X-Gm-Gg: ASbGncuA+gLii1++Q4Ya63PtUayIiNUhTCOn+334ZbLR7b2Pn40J0ywVub65qhpDIfY
	p9SghuQZxHq6y6tGMbNsvWLz3id2FEO+5EF8P/220213cIt2U5SVsWvRS6w/V8NBwOZngQp1awv
	P2BV97CqoTRONr2pfkhwrriZa8BuVjWBHfW8hmoRGQdiBnfgj3xwtxbkekWLvk1JOyIQNKvq7e0
	/jsRDox9S7VHfrIoRwydYOOBf/E7ZFNUfZxZ3B73yYZScvKB8DGbRfoAS7oVb1V3XMBdRIRSra1
	dffPLv5I7j5xMPgZBufrI4j8NgtsLbMeD3rSUFP6heq+xc2SWqtLczge3fFcsWCS3rxW1MHA+ZN
	Qkt0MTFbxSsD1mvGYHeXVBiueaoiRZN0TbBjNHvRJ7lhM8D3exUBKKGdlGGZ1Q5+F7LB7N/2uha
	IQfw==
X-Google-Smtp-Source: AGHT+IECkR47hvsdL+9m+5pzl69VKsLykS1FsMJqQLi4t/giX5+dtOhm9pCrB3gejt0/q6+HzdYG2Q==
X-Received: by 2002:a05:622a:5812:b0:4ee:5aa:9c26 with SMTP id d75a77b69052e-4f03feecc6fmr116922341cf.55.1765211066369;
        Mon, 08 Dec 2025 08:24:26 -0800 (PST)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f027d56ebbsm77854901cf.31.2025.12.08.08.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 08:24:25 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
Subject: Re: [PATCH 0/6] Initial support for Corstone-1000 with Cortex-A320 target platform
Date: Mon,  8 Dec 2025 11:24:19 -0500
Message-Id: <176521105955.2582997.707316582607520714.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251204152500.78818-1-hugues.kambampiana@arm.com>
References: <20251204152500.78818-1-hugues.kambampiana@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 08 Dec 2025 16:24:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6787


On Thu, 04 Dec 2025 15:19:47 +0000, Hugues KAMBA MPIANA wrote:
> This variant of the Corstone-1000 platform replaces the Host System's
> Cortex-A35 processor with a Cortex-A320. In this configuration, the
> optional External System (previously a Cortex-M3) is replaced by an
> Arm Ethos-U85 Neural Processing Unit (NPU).
> The Ethos-U85 runs in the direct drive configuration, where the Host
> System is responsible for managing the NPU directly.
> 
> [...]

Applied, thanks!

[1/6] machine/corstone1000: Add Cortex‑A320 support
      commit: b6b1a81f5e08a5ae1f1d5e36b951bdff438112f1
[2/6] arm-bsp/optee-os:corstone1000: Add Cortex-A320 support
      commit: 0faf5c4d37cd269caf2c8fb24f16c47b5e1dc02a
[3/6] arm-bsp/tf-m:corstone1000: Add Cortex-A320 support
      commit: a51ff01b8fef40a4f2c2d25a9fec07b1cb83353d
[4/6] arm-bsp/tf-a:corstone1000: Add Cortex‑A320 support
      commit: 4f82af2fa76b6a7b367ed3072af76fe998942515
[5/6] arm-bsp/u-boot:corstone1000: Add Cortex-A320 suppport
      commit: 7680400f782f11eb76061ba69a7b0409cd2a0a12
[6/6] arm-bsp/docs:corstone1000: Add Corstone-1000 with Cortex-A320
      commit: 3752c4e4478a6dbdf7a722a261d16ebc7a4a99e5

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

