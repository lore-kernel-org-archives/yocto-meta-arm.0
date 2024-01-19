Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 753C8C4725D
	for <webhook@archiver.kernel.org>; Fri, 19 Jan 2024 13:53:47 +0000 (UTC)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
 by mx.groups.io with SMTP id smtpd.web11.22509.1705672424360847770
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 19 Jan 2024 05:53:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=hUFZqZod;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.217.51, mailfrom: jdmason@kudzu.us)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-469893c4c11so273601137.2
        for <meta-arm@lists.yoctoproject.org>; Fri, 19 Jan 2024 05:53:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1705672423; x=1706277223; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZLMiKr3RzG8WFreKHHfBeyAw1rmZEp/pf7EDqsse5xk=;
        b=hUFZqZodegG2Kmp9+Qyj56Yec1+Rt3mEAlVRSQmYN2JrjR1uslQxlohPgMQhPUXVcB
         5aWham5WwZJL4TDp8cnzpYKhvVeN4rrJtzxxs4N0b5lM1sWtIDfcJTELw0rdng6qZ91b
         j56i5vkFatfQDhtwgRjwOcwOHgeOpcrq4pqQkKW0I9LontNRrRd3UhPuaujqDmbT5zVl
         baTfg8mycHGarfUoGrxDKV5fQqOk8HOl4KFFcKoNC1EBapVi7/Zj2VmZq9lvVRs1E0UB
         GDGxLWvTFEctA9n66uJbj3DYvOF151mubKYkBlyWi9gwE368dCqhHZ5tejbRQp2606Vc
         ZqLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705672423; x=1706277223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZLMiKr3RzG8WFreKHHfBeyAw1rmZEp/pf7EDqsse5xk=;
        b=fFRLMHfi/gs4zWG387r8kMWsTt9oxAZ/cA40exORL6Cjb8LN/NkVRZQyVTBzFlpRm6
         KpIKutiMpoT9soRfWSxUnM/Wd7ekyb0t10gLF2QZB9l5X4r9SgpgfewAvwNGgmPjm7Wv
         F79HPLry66fzjFppOhBR0PGSbKRwQDZvnVHqgBN/uDyNyC9Ysn+kPXB3UrfB/REQXxBo
         pp4ARpG0jR+ESCXA0+J5/WREujU2+k/ZFkUfXcn4DQIWL3jry6TOBoU5A/t8U4AgtSGS
         upNxxE5CmrfpZORycEffFYwwz63ysjCiuEuPFfgEZxQAASIhwD0Z5R13XlQ/B7/7q5+D
         3pcg==
X-Gm-Message-State: AOJu0Yy2wI3jgkz4GxOlSo97AfG5tecbUoJy/ketnrzz8DL71JjvvYvE
	RP13FS1+sJgzbRJDo6ifWOzeaWwbxvx7xUoOFpmrfgnZRlyXseSjWY0RlREk/gOLn4sW7FRs2sM
	=
X-Google-Smtp-Source: AGHT+IGzmfXoG66YsE/m0qzC1Qtk4eq8PHoB0fUwDbQ+YzzQNsVlfkE7J81/hKAEZ7YEByC8QC7O4g==
X-Received: by 2002:a05:6102:1917:b0:465:ea50:1ea7 with SMTP id jk23-20020a056102191700b00465ea501ea7mr2227062vsb.18.1705672423016;
        Fri, 19 Jan 2024 05:53:43 -0800 (PST)
Received: from localhost ([2605:a601:a6b2:2400:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id ej15-20020ad45a4f000000b006817505b0b0sm2884222qvb.98.2024.01.19.05.53.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 05:53:42 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com,
	emekcan.aras@arm.com
Cc: nd@arm.com,
	Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: Re: [PATCH nanbield 1/1] corstone1000:arm-bsp/tftf: Fix tftf tests on mps3
Date: Fri, 19 Jan 2024 08:53:29 -0500
Message-Id: <170567241031.3022113.1983746564114253815.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240118102437.106769-1-emekcan.aras@arm.com>
References: <20240118102437.106769-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 19 Jan 2024 13:53:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5347


On Thu, 18 Jan 2024 10:24:37 +0000, emekcan.aras@arm.com wrote:
> The tftf tests were getting crashed on the MPS3 and two issues were found
> during investigation. This change set provide fix for those issues:
> 1. The tftf tests were getting crashed on the MPS3 when compiled with
> LOG_LEVEL=50. So, reducing the log level and aligning it with the TF-A
> allows us to get rid of the crash.
> 
> 2. Once the above crash got resolved, it has been found that tftf tests
> were getting asserted while reading the value of the register
> GICD_ITARGETSR. The reason for the crash is that the value of this register
> is zero. As per the GIC documentation, this register is RAZ/WI for uniprocessor
> implementation and corstone1000 is uniprocessor implementation for FPGA.
> So, this change compiles the tftf tests in release mode which allows us
> to compile out the assert definitions.
> 
> [...]

Applied, thanks!

[1/1] corstone1000:arm-bsp/tftf: Fix tftf tests on mps3
      commit: 987d685ed0689808f11a0fd855d47921cddb926d

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

