Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A6DAC4321E
	for <webhook@archiver.kernel.org>; Thu,  7 Apr 2022 15:41:14 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web12.1771.1649296824478602829
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 06 Apr 2022 19:00:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=OTL4EayW;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.41,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f41.google.com with SMTP id i15so4000860qvh.0
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 06 Apr 2022 19:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uEfMxqKhShwKNle0uWxh9ZnkkvKht6/0Q41BXLa144Y=;
        b=OTL4EayWp7ipAgejqtMseUBJK6qtAr5h2VCwBcaWBYZpkyRp8EFHmU3FTHqznn2iqy
         mlizc0dIEnMCjU4dytxHpLs+jefzaEd1DRt1cWrZxwHFcwjH8DsnObdveyl/QMLcfMbj
         4HUZgvPx2R6mbFCqvyK6NA+bKHlm7a6Ll7cfJngQZMsZDL/JMSQU4UQifcSkFxchPJ5S
         rk6p8arcshP+cmhkkpd008jktiM36REm4wptkOtsd/lCuwwQ6DhG75MKOYSgrC+MS3g1
         dhmaFNGNpe40YIT8KRkQ4mwlxixHc8Yo9Ia+OG1TsPXCxjl1ctdLVM5gAdCjUJD3TWPD
         FsYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uEfMxqKhShwKNle0uWxh9ZnkkvKht6/0Q41BXLa144Y=;
        b=F5WJlSY5Hsiy9pS4aaagh4bWyRQcxji7VK5mEBMelzxt7zQUF89gvsNbYDbr4X36BI
         QfzhXV/C0O28dFjyow4WkoSZs/9NGvdHoAsLW6RZOIY2AlFJuey+o9R4nr4h4nUOsgp/
         bSWRFpjwWp+Gyg0RR2O7e+qvofDp+FzrX9pRylSQi0/HiCLf5n+1xcUwIQCxpAqfK1Wl
         1d+iJs+Ni5HKY4YtXBxignWL/o0pLHkNzV5dO05XqznwHCgJPWqA6ucFOCUM/2d34DC6
         4LBMBkDDoSSyAmg0XED80lv8n8WgBRL4XDz/EmGHyVwgS0HOQKSUI25F/sYbEnipIbNI
         smJQ==
X-Gm-Message-State: AOAM531vQwgJLancA3rIRqIx8dKLz+EUSD53RwS+fkLXc9G3tlp3LXmy
	SDnmXU9osl21uarY2oh1f8sdPoRyQVvFXw==
X-Google-Smtp-Source: 
 ABdhPJwViCqGUhFZVeyCUpQ/SGZjNcLedGXkXSX62IOLcibCecdOR4b1IuPQXjtbTycpd4sUQRGiOg==
X-Received: by 2002:a0c:c3c6:0:b0:42c:17e4:9a75 with SMTP id
 p6-20020a0cc3c6000000b0042c17e49a75mr10167574qvi.124.1649296823286;
        Wed, 06 Apr 2022 19:00:23 -0700 (PDT)
Received: from localhost ([2605:a601:a66c:b900:3b2f:a3a7:b707:646])
        by smtp.gmail.com with ESMTPSA id
 u17-20020ac858d1000000b002e1cdbb50besm14632040qta.78.2022.04.06.19.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Apr 2022 19:00:22 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Peter Hoyes <peter.hoyes@arm.com>
Cc: Peter Hoyes <Peter.Hoyes@arm.com>,
	diego.sueiro@arm.com
Subject: Re: [PATCH] arm-bsp/linux-yocto: Enable virtio-rng for
 fvp-baser-aemv8r64
Date: Wed,  6 Apr 2022 21:58:21 -0400
Message-Id: <164929670183.2494435.11227405127099294972.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220406170915.304097-1-peter.hoyes@arm.com>
References: <20220406170915.304097-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 07 Apr 2022 15:41:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3246

On Wed, 6 Apr 2022 18:09:15 +0100, Peter Hoyes wrote:
> A virtio-rng is available from FVP_BaseR_AEMv8R version 11.17, so add
> to the device tree and enable the correpsonding FVP configuration flag.
> 
> This improves the boot time and removes the following warning in the
> boot log:
> 
>     random: udevd: uninitialized urandom read (16 bytes read)

Applied, thanks!

[1/1] arm-bsp/linux-yocto: Enable virtio-rng for fvp-baser-aemv8r64
      commit: 4c2f4ab95e3aee2c12d9dcb6fc4171acb42cd1d3

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

