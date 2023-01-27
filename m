Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD7E7C54EAA
	for <webhook@archiver.kernel.org>; Fri, 27 Jan 2023 18:25:11 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web10.109875.1674843907891062134
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 27 Jan 2023 10:25:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=o7ETVkxP;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.41, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f41.google.com with SMTP id d13so4451550qvj.8
        for <meta-arm@lists.yoctoproject.org>; Fri, 27 Jan 2023 10:25:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WavS/SElTg4RWXgmdZfm148CN/QiylMfvCbADpZ01zQ=;
        b=o7ETVkxPNxlk4EVDmvfeeFChc7Xcsc3DRprk0FIhQ/fTclciZJn/haEW6p94tRI2e/
         JHqGW5ho8cIyblThAJp8ekg0mT2jAmTQZV1ZT9d5MXziTBLgX2zl867Hi0vceIWglq5u
         MYaA+QHqwM3ykwf7Jy2yezept6ritwGtjXJqlX1v2eawxm/Czofvfc9OcIX5X+lKPSwN
         aQbESOKkksHQmpJUulZK4CAo56jxfpVhiLLasqCNobuM8q/RZeK4vCczlSm9KCUn2M+B
         WZT5iYuogBvb2HMdzxuMDBsAMlhQogOMwBILTPm6eHRE7DlYN+wnaiTMqJzs7A4yJcZN
         JFjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WavS/SElTg4RWXgmdZfm148CN/QiylMfvCbADpZ01zQ=;
        b=cQSHKVLj9OPI40MNzWMn5fhBzH9bv0ag/pOnI6XZQ2uXeyZUbroWA5Jj30/X1K2Qnk
         QryNJbLeMsLhPFwUn/pK1gxLZ6G0F5S6Jx/Ns4YPilkZ3Hoo7nZbx3mpc1DN3gRa4l1f
         HqaFG2wwjHisZ58gtDzF/FX+ISrm4hjzHgP76Z2FdWhV2iod3B3IxZ7Keor9ZeNg+DX6
         cVEI8oZr4lXHZ7TblZ7SeqvN0UVpZzbYYWcXzgptM6cNmInYXtYzzXnz4gukd1dG8nVH
         x+Wd3bT5RKYopyEeaZM7+NMfI2K/nSWEjDXOFV6cIbvTelv1cGnWEfQ96wx3blN0h7HO
         1sdw==
X-Gm-Message-State: AO0yUKWTTc4mtVR5mJaX+8r5BDdMn1jsOQ04yb+/z13kO8DoR6BRXwjT
	agyexW1+sZ8CB+EXrvZQ3RXB592x89Be6mNG
X-Google-Smtp-Source: AK7set+ty90LTVGvW9u24VripjWcCupIZ7VwGqCIH/FrjyslU8ua7zVRNm7HDtw5hZFnUxm0Z09s+w==
X-Received: by 2002:a05:6214:88c:b0:532:1fc2:9ad5 with SMTP id cz12-20020a056214088c00b005321fc29ad5mr9106908qvb.0.1674843906558;
        Fri, 27 Jan 2023 10:25:06 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000::59])
        by smtp.gmail.com with ESMTPSA id w66-20020a379445000000b007069fde14a6sm3341162qkd.25.2023.01.27.10.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 10:25:06 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] arm-bsp: add u-boot v2022.10 support
Date: Fri, 27 Jan 2023 13:24:46 -0500
Message-Id: <167484388780.842866.3179731258075645367.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230127134523.11563-1-jon.mason@arm.com>
References: <20230127134523.11563-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 27 Jan 2023 18:25:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4329

On Fri, 27 Jan 2023 08:45:23 -0500, Jon Mason wrote:
> Upstream has updated u-boot to v2023.01, but the update is causing
> problems with some machines.  Temporarily add a v2022.10 recipe until
> the issues can be resolved.

Applied, thanks!

[1/1] arm-bsp: add u-boot v2022.10 support
      commit: 508ed52a4f1d834f97d34ef395660a5c25d2edc4

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

