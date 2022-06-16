Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CD69C433EF
	for <webhook@archiver.kernel.org>; Thu, 16 Jun 2022 15:36:04 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
 [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web10.19322.1655393755233403616
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 16 Jun 2022 08:35:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=QwgVXXDb;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.49,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f49.google.com with SMTP id q104so2588349qvq.8
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 16 Jun 2022 08:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5Atiotrmffdk9tB6K/tmRx0QTGZIGlI2JtiHAOB8BjY=;
        b=QwgVXXDbQSuIkRtVltMyjUSkvq0fGZrG3OQoFXHHECMZwoslKr0Y+7hNCarYIC87ca
         O56z7y3ZHwyjPemF5wlo6Dk5H3sAOPP6euzrmCIg4vaIxfnNyhjzpJODi8vbF6H8ioPP
         MAHJkRAh29Gi8QxIIYoqah3RZNJaO0y8InI0S5fm6Vz3TnKOIKcPwzgm4oIABJI3A1cD
         KqWDWNo6AnrcCUJT8TgADSxvBIzck9qaJgHHcP3DCxXV+dYsJ/ym8HRyRkesCOnbDTia
         MxLc3UHK5iOQ//foTjCutOin23KNxs2Ga+Ez/zliM0tKoMLd0x2digNhzA/Bct1y0MlI
         d1nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5Atiotrmffdk9tB6K/tmRx0QTGZIGlI2JtiHAOB8BjY=;
        b=j8rr3yalEM99B7k1xg8/q3ULSf/RWqGlQwsl5nINDUFeaxzt/MQbtHHO2dn+W+OG7k
         NNH3ZAB81QOov7NBRgq035i5Zt/olSKqZHB/DhixE44CkkVtRTh5+akHpwgJZUez+d8T
         lUxCg1Tgc2pD5+nd1UNiVBwokBtIPhn6yfrl1K6yO9WMjXrA603Ktg9h6eHJgQuCMu/d
         rTEqBlaJj9C0CovkMXVuWWeAwlzvqcpOSR9gBmss9udq5AO7F4VHhyb7srWpBCMWZya8
         2zLWcJ1eJsGaDGdjKJVhcnn1X8ahC85Fglz+xjcoHpARn2FL54DJCxO+lpMhYYRgX1/7
         bX9A==
X-Gm-Message-State: AJIora/JCBlMFOEDmevdx298NOq4h8Eb6jgBTEjhpJaJFN0kzNg7O/HO
	dMQ7cdVVmN7dSouvbGZNNlwtZ7ETa9DM3Q==
X-Google-Smtp-Source: 
 AGRyM1uBWQcRsA5qIEZqJ2ETV1uCEDGsuh/N9sUTjGIw0cFYzB1Zoc4F99WPFZ+baMybCWs8fRYd6g==
X-Received: by 2002:ac8:5acf:0:b0:306:67ce:ac00 with SMTP id
 d15-20020ac85acf000000b0030667ceac00mr4424692qtd.267.1655393754226;
        Thu, 16 Jun 2022 08:35:54 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 i10-20020ac85c0a000000b00304e1709b1esm2322231qti.43.2022.06.16.08.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jun 2022 08:35:54 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH 1/3] arm-toolchain/androidclang: strip meaningless RPATHS
Date: Thu, 16 Jun 2022 11:35:39 -0400
Message-Id: <165539373972.3162929.2772011250765360656.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220616112252.3326107-1-ross.burton@arm.com>
References: <20220616112252.3326107-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 16 Jun 2022 15:36:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3515

On Thu, 16 Jun 2022 12:22:50 +0100, Ross Burton wrote:
> As per [1], target builds of androidclang produce useless-rpath errors.
> 
> /usr/share/clang-r416183b/python3/lib/python3.9/lib-dynload/_posixsubprocess.cpython-39-x86_64-linux-gnu.so
> contains probably-redundant RPATH /../lib [useless-rpaths]
> 
> Those RPATHs are of no use, so we can remove them entirely.
> 
> [...]

Applied, thanks!

[1/3] arm-toolchain/androidclang: strip meaningless RPATHS
      commit: c4041b667dbab0285145bdc78decc85e341e0072
[2/3] arm-toolchain/androidclang: move to libexecdir
      commit: 70132043376ea3104c95f94ef19932aa36f4dd52
[3/3] arm-toolchain/external-arm-toolchain: remove pointless SUPPORTED file
      (no commit info)

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

