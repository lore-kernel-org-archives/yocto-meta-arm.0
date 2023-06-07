Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51B44C77B7A
	for <webhook@archiver.kernel.org>; Thu,  8 Jun 2023 02:11:46 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web10.124.1686190301670646078
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 07 Jun 2023 19:11:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=v0/op+SL;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.177, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-3f80fef8b48so785411cf.0
        for <meta-arm@lists.yoctoproject.org>; Wed, 07 Jun 2023 19:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1686190300; x=1688782300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jZ0/AY6SoObgeSXEcWZDF8h+/LQFyKIZOcRmameoza0=;
        b=v0/op+SLamaQr2JUTWyh9Bi/YwZZl7NjYISHeFAWaNMY+csuXax9BhI/DVhXJbxaOS
         fFAKUnKt6WXKtVsMBsGyvgqn657SdcIkx8rWm1yJqbyHO7qEAz0pkPgaHygZezB3fdDB
         cWOPgxRwsQ8Q2FUMsOq7SNBlsz47VEqT/PTVx09a+I8sunBxSVbzTvXcPB/cCBiTQSqg
         cKtrxUiUPc9WTeoJIYIJoiJqzio9aAspLYG6u4ieIwFH8OSIbM0ZHlWVb0Q2MiMWcEx1
         2iWeWd12a2Fd/JGCPA+b3RjBFLX1WQKMfF5zgWrn7MXoFhOD/pRfDgbCwTSaCyXoRWiK
         xCOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686190300; x=1688782300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jZ0/AY6SoObgeSXEcWZDF8h+/LQFyKIZOcRmameoza0=;
        b=DKubpk8hg8o26hwnQCQPjY8Z7gcd3AayrgztYXCqqRcBYEl1MhgWC1fY2oxocZcX4N
         5aLp5Ush8RJ8kfulwdYZeha40gSH78Lxnh9toN9m6EC5BANzXe8dLszaFjWIKMSY5DQt
         vWuPxcpNRHCW35zYBD1edE9YvYbjFbWaM1dZRXCKML+TuFuMbGz6VCAmIApTL+wqOITM
         qBWM2fL1g3CeaKW9FrwirRFaZVOWBF9dFVrq5NGgJcP5TL4nzfDj0Uy5AGFwrQHRJsxy
         dcAYYcOrLRXZsJ3FWFPO2MCGbNl6xCInlsfKEmK3xEC0NFWmFr5fSj3iJgxsK0kFcPdV
         YtKQ==
X-Gm-Message-State: AC+VfDxukPGOjm/d8VSlUPjgNPc0PzoIt8UFI3GHmZPpViGO3lJW/RU0
	xgc3LRnV6UxJR2eh+3AP/cFEWtfLYWmmXwLT860=
X-Google-Smtp-Source: ACHHUZ7g4/YeFXdP2kylNVb5grAL10EQanMShOQlkGz4Khg1u2sCsL54MfUSfTUfKDUe0IAHKTnG5Q==
X-Received: by 2002:a05:622a:1011:b0:3f9:a7d2:f85 with SMTP id d17-20020a05622a101100b003f9a7d20f85mr1234365qte.2.1686190300241;
        Wed, 07 Jun 2023 19:11:40 -0700 (PDT)
Received: from localhost ([2605:a601:a600:7900:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id y16-20020ac87090000000b003e302c1f498sm367670qto.37.2023.06.07.19.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 19:11:39 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Claus Stovgaard <claus.stovgaard@gmail.com>
Subject: Re: [PATCH] arm-toolchain/gcc: Workaround for missing libcrypt
Date: Wed,  7 Jun 2023 15:33:12 -0400
Message-Id: <168616639801.3869142.6186668135898460371.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230515111522.657505-1-claus.stovgaard@gmail.com>
References: <20230515111522.657505-1-claus.stovgaard@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 08 Jun 2023 02:11:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4744

On Mon, 15 May 2023 13:15:22 +0200, Claus Stovgaard wrote:
> gcc-arm-none-eabi and gcc-aarch64-none-elf both fails when packaged as
> RPM for sdk with
> 
> nothing provides libcrypt.so.1()(64bit) needed by nativesdk-gcc-arm-none-eabi-12.2.rel1-r0.x86_64_nativesdk
> 
> This is a workaround by skipping the FILEDEPS

Applied, thanks!

[1/1] arm-toolchain/gcc: Workaround for missing libcrypt
      commit: 3fcafa3a945aa57d58ca4f1a0f6d20280df7cdbd

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

