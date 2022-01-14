Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D740FC433FE
	for <webhook@archiver.kernel.org>; Fri, 14 Jan 2022 20:56:31 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web12.13069.1642193790744747729
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 14 Jan 2022 12:56:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=SAzwavOT;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.172,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f172.google.com with SMTP id bp39so11957812qtb.6
        for <meta-arm@lists.yoctoproject.org>;
 Fri, 14 Jan 2022 12:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=isVrj6SHOl+R3sBr8PeJ5jcast/1p+x2v09Rsu0dHZs=;
        b=SAzwavOTyIlDijluqFN4gTwOpcEALYDw+BK5my4GcbgCGBMPZGtz2HIGBIPlIVOEj7
         KGRoa6fnC9OF5kSUGK0l5F/e4RccGhSfveNOshPiwvX1OGfAobVrpcXMw7xktW2T0A9z
         ue5UyyCLBoytTEfmMaTlD0aHnX0QXu4o2mIOn01qswieCeLr745eKAqt6M6RvVFKxfS6
         R0+s7/jJIuYUu2ni46TRKIcaMedfNuPWAMW1FZUcesDLXNfRhdUTzrA2o4wVCgBECehr
         C/yXptuU/pEsRtl4tRTnZPySS9nFlbDU8infM/ym4rAcDX9vaMQwUCCdJrRcnOVgF4pH
         W7pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=isVrj6SHOl+R3sBr8PeJ5jcast/1p+x2v09Rsu0dHZs=;
        b=woQif4zB68FaPhjtBu0Bs1zOhEWCcISGUC3ksy6M5CPCBpPnGiy7OwGWOmf8ur7kzo
         W1jRXS2O6vpQ7+v3yLiKHq9o9vKf6vH/sWN/f6D2quZNMLTvg21vpEBf+3Hw7ChQYB44
         XS6xPFbCwsrISpEbtISujoSZ5xHD41QPfz2mHFnTuy2gF/OepsQWDzW3a7RG6Tlz/X6s
         YlrfKOD1RPrqvFbLOfxoJTmgcy3Fn6lgDuOpZlU84tMdFEs9KDcd3iTDGdm9NSKZOGWE
         7KP3sks135zbifYOTg1c4OMQpoAee8JNtSbe2vYyVfIDX47IZX9O9v3RbT6SW+Jg3AtB
         JTwQ==
X-Gm-Message-State: AOAM530RdzTgPfyDs+tyIUrt0BEhUWWNTMTaN/o3PXUcWn9o+Gmg+JOn
	6xQbYMA8p6+YqAWv4DC9d4RH8bTryeUy5w==
X-Google-Smtp-Source: 
 ABdhPJwXKT26Y+tJDaew5PnIl5up+2FNRRsDoc25/8D+cpbdIgJiuPRN8DbdQ+PVnrxIGpAxyCu4/g==
X-Received: by 2002:ac8:7e81:: with SMTP id w1mr9126274qtj.392.1642193789862;
        Fri, 14 Jan 2022 12:56:29 -0800 (PST)
Received: from localhost ([2605:a601:a63c:b500:de4f:97a0:457b:40cf])
        by smtp.gmail.com with ESMTPSA id
 w9sm4523899qko.71.2022.01.14.12.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jan 2022 12:56:29 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Peter Hoyes <peter.hoyes@arm.com>
Cc: Peter Hoyes <Peter.Hoyes@arm.com>
Subject: Re: [PATCH] arm-bsp/fvp-baser-aemv8r64: Fix PL011 and SP805 register
 sizes
Date: Fri, 14 Jan 2022 15:56:15 -0500
Message-Id: <164219377455.3112018.5459357123333736021.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220113143823.3303295-1-peter.hoyes@arm.com>
References: <20220113143823.3303295-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 14 Jan 2022 20:56:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2834

On Thu, 13 Jan 2022 14:38:23 +0000, Peter Hoyes wrote:
> The Linux kernel expects the peripheral ID register to be just below the
> end of the address range, which for the PL011 and SP805 is at 0xFE0 not
> 0xFFE0, so set the size to 0x1000.

Applied, thanks!

[1/1] arm-bsp/fvp-baser-aemv8r64: Fix PL011 and SP805 register sizes
      commit: 3d38ee3e1106d18b3ba6a0cf0925718149cd7f05

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

