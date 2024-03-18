Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C11CC54E5D
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 18:31:16 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web11.52967.1710786672743719299
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 18 Mar 2024 11:31:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=1mW0bd23;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.53, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-690d054fff2so30701736d6.3
        for <meta-arm@lists.yoctoproject.org>; Mon, 18 Mar 2024 11:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1710786671; x=1711391471; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f4kc2iy46+pckof70eX0tFxvmpmiPT6KpVQo2KVCYqY=;
        b=1mW0bd23Zb2GtqfrQBuROKYctPnKeSAtv8tKf6QGYfts6+Zq/muUyGBqEzNh1nIH+A
         aFtXHt3UHm4kYMa9vKn5P6LWQMZ8hLx+4q9p2rSZJkjjbylSo0mjbooyxTCr7WBeGzkr
         G7dcI0OHFJcxLwioat36RRsdIUnuq3oMC+O2WT7Jyta/AgaA1DPWTOdy2gphD1BsNX9K
         n+KTbkJPSQiU6VobUqUUJH0/ZjNTPM45yknkUWBQajN3AefLFIrbuncvZmGPlPbylEqG
         plRCdcZqfF/aiQ/I/PzBV7CPZNGZjnkeImcb6G8+T2LkRxqCLW6K5jfbKJRKX4UuKebl
         ngAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710786671; x=1711391471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f4kc2iy46+pckof70eX0tFxvmpmiPT6KpVQo2KVCYqY=;
        b=kh9Fdt2erWra9xb7N2m06WDN8kNUsSc1C0DFiSNQn9n6Rleo27JZORnhx7RfCf9SUr
         80LFnhgQuKmfA0Yh8aM32efVe1zGfbSyV3GkRLQ9nhcZZS8TXjsWsUjsAq/ID4jSvLDN
         R1hNBOF1+XxurP0G+/zQ0rZlrJtlVwkaWOiPjAT3GFscVJdzIp4CnE8a4pc3mZu5qfjF
         0vS7upZjkbuCyhPGsLQ7SSDT+w8VPX8aN1G52HB1+8LuC0tbjeQM0ywoCF8nZaO+FKRW
         RZ8Ii04E8JBu+hVCodnCyjFvggAwSJGmHo6ze7NyD198MfTnpboHJQhz19g/FXuI5KkS
         xoNw==
X-Gm-Message-State: AOJu0YzIvhlOm2lvxcxTjskdce3ATnDgPiI6MqGNUeS1ABM2vuF1FuEw
	NoOcCoTlMJH8K25WvCSpK7OUOCsCs8aXukDkaO0eeWtI1A9pJ9eGuDIlX7Uonx6BDp4+ehbzsN8
	=
X-Google-Smtp-Source: AGHT+IHfkRFK8OL7lqS/0/WXRI4+z39WdFJJdwS1aSxM7Snif2oQCaXDmWZcqYrhCnOqpqiSq4E5gg==
X-Received: by 2002:ad4:5192:0:b0:690:b636:a9e3 with SMTP id b18-20020ad45192000000b00690b636a9e3mr274768qvp.4.1710786671706;
        Mon, 18 Mar 2024 11:31:11 -0700 (PDT)
Received: from localhost ([2605:a601:a6b2:2400:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id a9-20020a0ce349000000b006916003c53asm5304561qvm.27.2024.03.18.11.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 11:31:11 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] arm/optee: disable clang due to breakage
Date: Mon, 18 Mar 2024 14:25:37 -0400
Message-Id: <171078633830.3024366.10015918426766532621.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240318023558.85348-1-jon.mason@arm.com>
References: <20240318023558.85348-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 18 Mar 2024 18:31:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5455


On Sun, 17 Mar 2024 22:35:58 -0400, Jon Mason wrote:
> With clang 18, optee-os no longer compiles cleanly.  It is now seeing:
> 
> | In file included from core/arch/arm/kernel/vfp.c:6:
> | In file included from core/arch/arm/include/arm.h:131:
> | core/arch/arm/include/arm64.h:436:1: error: expected readable system
> register
> |   436 | DEFINE_U32_REG_READWRITE_FUNCS(fpcr)
> |       | ^
> | core/arch/arm/include/arm64.h:417:3: note: expanded from macro
> 'DEFINE_U32_REG_READWRITE_FUNCS'
> |   417 |                 DEFINE_U32_REG_READ_FUNC(reg)   \
> |       |                 ^
> | core/arch/arm/include/arm64.h:411:3: note: expanded from macro
> 'DEFINE_U32_REG_READ_FUNC'
> |   411 |                 DEFINE_REG_READ_FUNC_(reg, uint32_t, reg)
> |       |                 ^
> | core/arch/arm/include/arm64.h:398:15: note: expanded from macro
> 'DEFINE_REG_READ_FUNC_'
> |   398 |         asm volatile("mrs %0, " #asmreg : "=r" (val64));
> \
> |       |                      ^
> | <inline asm>:1:10: note: instantiated into assembly here
> |     1 |         mrs x8, fpcr
> |       |                 ^
> 
> [...]

Applied, thanks!

[1/1] arm/optee: disable clang due to breakage
      commit: 67901eb5cbb774f5eac69374ee75b6dddac893c6

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

