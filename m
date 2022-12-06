Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADA1CC352A1
	for <webhook@archiver.kernel.org>; Tue,  6 Dec 2022 16:57:53 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web11.53380.1670345870262708347
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 06 Dec 2022 08:57:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=6TgpJBUC;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.180, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f180.google.com with SMTP id k2so7929657qkk.7
        for <meta-arm@lists.yoctoproject.org>; Tue, 06 Dec 2022 08:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tf44lQ3BYzGbjDAmUrNRz3s25Px2MJ2DogHfE4s0AAc=;
        b=6TgpJBUC4f+aR/tKqqKhpEa+SDpUZeM/w6GaH7YE+womm/acreqIjKiIYalzc3cV1J
         dudPVKG9A+dS7BHGnZSYVqTC9Lwaz1hlZfC1OtXV2vKoNaoPF6nT0dWp685xa12h71xB
         Rd/H1XN+wY5GYol/3yeWW6j2Ci5Fn//bKo5wG4E3sZzgttqFjrFHVmMDD6/4wFCJECHA
         illHoRzCAtUT2blObTu2quCCsAZRXbyyCNhV/QVhXfA4CglkryYQxK5vmL580rfv6c8e
         r5QGBJWKzUNpBQBzRAVRZu6GG5z6Y8KJm75Lr6VPU4ipSppCDgCHLMHifXLTBfypH1Td
         zY5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tf44lQ3BYzGbjDAmUrNRz3s25Px2MJ2DogHfE4s0AAc=;
        b=FlGNiZP9tpVuDn/ixHOBbzazFyZIWv3kZ40BD/82cGKZpiVK18UKkrKCt2YIvU1nP5
         KCylRWY8G2yhIl0AIqS6pgD1t5KYuIzvoNhv3knATKYfSidURhLj0AX4TkcheSxWp6Mr
         eG7jB94LJqRCqJB3rmr3rNnPiMOfwwCoWim214Q7zET55wxTb6/VExqSgwCpqjQh0W0q
         yWPt3TPzkj0dkUZnRZp+IV/i1IuKeI7uzOV4yASiY3ON5FmZsXlHoV1vdCSRk0Z7KGBa
         e9fsvkUuH/bNsCqBmmFmJtvrhUrUag9GLopzmOq+YBNSViH274gQ2auNLV5QpkMMB6R/
         uq7A==
X-Gm-Message-State: ANoB5pk8EaZvhxP5CP5uHuXA5ppgFCNg9ARfEYypdz4Ax2sbOxhsheqE
	jCeJbmUpMEy+az9lhUnsxGY2bdppt4Q3IMtlN5s=
X-Google-Smtp-Source: AA0mqf786ODJNpYvdKE2zczQGow1awxlXJi0QZYU9wHy5PcSg/Js8zUNM98ltxpEJjK4NC3piim7mw==
X-Received: by 2002:a05:620a:745:b0:6fc:a605:8d5d with SMTP id i5-20020a05620a074500b006fca6058d5dmr21132354qki.621.1670345868961;
        Tue, 06 Dec 2022 08:57:48 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000:24f9:d5b6:38a7:110])
        by smtp.gmail.com with ESMTPSA id bi19-20020a05620a319300b006b929a56a2bsm14781060qkb.3.2022.12.06.08.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 08:57:48 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	"adam.johnston@arm.com" <adam.johnston@arm.com>,
	Ross.Burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH langdale 0/1] arm-bsp/optee: register DRAM1 for N1SDP target
Date: Tue,  6 Dec 2022 11:57:42 -0500
Message-Id: <167034586260.294403.5088522813792562936.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221205191309.573109-1-adam.johnston@arm.com>
References: <20221205191309.573109-1-adam.johnston@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 06 Dec 2022 16:57:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4179

On Mon, 5 Dec 2022 19:13:08 +0000, adam.johnston@arm.com wrote:
> N1SDP has 2 DRAM's. This change is to register 2nd DRAM which starts at
> 0x8080000000. Linux uses 1KB of this memory to share data with optee-os.
> 
> Vishnu Banavath (1):
>   arm-bsp/optee: register DRAM1 for N1SDP target
> 
>  ...lat-n1sdp-register-DRAM1-to-optee-os.patch | 52 +++++++++++++++++++
>  .../recipes-security/optee/optee-os-n1sdp.inc |  1 +
>  2 files changed, 53 insertions(+)
>  create mode 100644 meta-arm-bsp/recipes-security/optee/files/optee-os/n1sdp/0005-plat-n1sdp-register-DRAM1-to-optee-os.patch

Applied, thanks!

[1/1] arm-bsp/optee: register DRAM1 for N1SDP target
      commit: ca4b469ac5bf67573923ac2effa7238179dbf5f6

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

