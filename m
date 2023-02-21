Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EF3CC61DA3
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 13:59:17 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web11.43111.1676987951822944287
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 21 Feb 2023 05:59:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=Chb3zanB;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.169, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f169.google.com with SMTP id h19so1555682qtk.7
        for <meta-arm@lists.yoctoproject.org>; Tue, 21 Feb 2023 05:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mfx0eo56fNrFCqV5/pHqQ8dnfTEdssnSngqvHzdP4aE=;
        b=Chb3zanBGT8fdUoosaaHFgM6TKYsnHPV6Q6w4bcbb+8wNNWS1Oe3nyv620TEihaYwN
         8g4SO+Fv9lsh9fxb7n6+U3RY/RtzH0bXb+MYn6Vd50ZAIRWkFa5CpYV7BrhI/ngAOVlk
         NVsQRpKKbhk00Pciuf3zf+jOpyk+pYDfle5w4tvPFoAPmK+/q9XpD23wKtgUtx33g7pq
         E5dJzs+6WpZ6UFub0YMDRq6DDLv/pA2TV/6L8QPb9A94jZME0nwhgQg3b7pYaxSSzh/8
         GQZYWZrsOLSWM+tLymDhhx3XEPz0PVkK2s9R3cu1KLbuMUmhfBbsAQpwAZoprSV5IFmH
         ReNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mfx0eo56fNrFCqV5/pHqQ8dnfTEdssnSngqvHzdP4aE=;
        b=pV9dt3Hg/z6/d53kyT5JFKe5PU8cBcQdY6kk1ZM3JLXrasxfvB5Eq17uoLTvFWA3/n
         1O6pA3xyeSfS3bsFIipeTG9Cfi+c85uww8uArT72f5tsMUgV+ccczUloYYN6/o5DuHo9
         /LDtZ2mXNlgVg465uf7n2Q01qXIZGn+vHoKfBooQhnxtAru63v3ojitD90Hgs+4Tw6/L
         GmCBFMOU1+N9GJubud88pU14i/QYMpfheHNdeUS0PzPWpiDwnwpjsu0WUJyNHQeKg3zt
         xUHAvjE57qnD4SKieP0p207+BtHgWPxRY2MemWLsZP80zfMEJ7O7Y/VAcMVjKpe4OdyD
         qHyQ==
X-Gm-Message-State: AO0yUKWOb6Jje4wwCIDWZnI2dp7gtxbFUovSFws6wzlW7btgNzKdFgaF
	PneB2Mzn+BTOtHImHrG4Pq93mcex+s9pX4DI
X-Google-Smtp-Source: AK7set+dN47TdKtoXp0jT92bDxyUiYiLQQcTAHpNdIXWxmVvEeoUn1X9M1q3G7QGvpxyDKxQW7ojiQ==
X-Received: by 2002:a05:622a:413:b0:3b8:6cd5:eda with SMTP id n19-20020a05622a041300b003b86cd50edamr9014054qtx.47.1676987950413;
        Tue, 21 Feb 2023 05:59:10 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000::59])
        by smtp.gmail.com with ESMTPSA id t82-20020a374655000000b006fa16fe93bbsm393258qka.15.2023.02.21.05.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 05:59:09 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH 1/2] arm-toolchain/gcc-arm: add missing Signed-off-by tag
Date: Tue, 21 Feb 2023 08:59:06 -0500
Message-Id: <167698794643.2409209.16103325963288340470.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230220154841.43053-1-ross.burton@arm.com>
References: <20230220154841.43053-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 21 Feb 2023 13:59:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4428

On Mon, 20 Feb 2023 15:48:40 +0000, Ross Burton wrote:
> 


Applied, thanks!

[1/2] arm-toolchain/gcc-arm: add missing Signed-off-by tag
      commit: 69b73682b3b7c691716e6baaf50fee9a98548ef2
[2/2] arm/optee-os: add missing patch header
      commit: 047be751caf26735bb1de2b7d6ad296d9dbe7ce9

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

