Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55E95C433F5
	for <webhook@archiver.kernel.org>; Wed, 11 May 2022 15:46:18 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web10.1112.1652283969076436315
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 11 May 2022 08:46:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=m68LWhtb;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.182,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f182.google.com with SMTP id x22so2296811qto.2
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 11 May 2022 08:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=k71DtRel3hwLxIPz+sm+Q6cri7950Z8+YuP0kJf9Nlc=;
        b=m68LWhtb9h/mVaz1vU/mXy417Zkz5EX7/SD9gYSmbIDhtUEPWQcZqvI8ry5rz79hzJ
         xXZBNRsQkv/OKtEeEwTAhpjr3kRo/saRoZug/3iTZlz5CSAnufG99kuUjNirLUPzgtvW
         eWBWRSeZMB7vgCC5QFXqZKlFXpcBxkQf9EzP8WkC6QrpeIMbVaWW0IMV8h56Tn6Gsifd
         j1zbzp/QbUAdJO4AdsYDsqDS3WdMA9nRy+xEf8TeMzglUnvJXKek5U3eOWMEWmmVLNos
         e1ZFkbQbjcH9rQS0odkPCP5XWcJ+LHHxar8l0kWkIaPHmm5e1r/hwXCnmxjg3V6xjX7u
         43gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k71DtRel3hwLxIPz+sm+Q6cri7950Z8+YuP0kJf9Nlc=;
        b=PEn2zF3FfKe77NpxjIkDi4WlN94L9dMdJ0/bdbvg6O5G7He0wQEPX3x58knbmdXEqu
         YjwEByWEEqutnF1R0LVnzWi51IEOVwsnkbW0+vyrCQpIDYc+tJfoN7e/gEN//XkUCwXX
         F72bUypC/oSJh/SJs6IlaYoeMLQVzqjG4S1OTFpG4XD1tL+rs14WrEnBjCCVL5GiOwR8
         ZIOMjUxYyJ1Rwx3+34x1V381zAijNDXQS0spkvADy4DpvoJ8fyHXIBvWpuo0Opu1So9F
         AOySJKXPxZAnHm4x/i9x478L6mn19bcXn85LDlBrrORM54mq58EvY4ypGTbKw1U1LG2r
         wMSQ==
X-Gm-Message-State: AOAM532lZh4lvzzhaPnpwFGq2+f2t4+iPlwodi9zdr0I0knbCDi/zk/c
	kz6rdYRIcYNrgQP6yMheiigZY9Kf/sbQfzMb
X-Google-Smtp-Source: 
 ABdhPJxlb/qmHmw8z9duUMnbOoCitdYDhZ786xl+YZt6UIIc0x2S5Ano8N7el9aalgWUxIlp1WUCKw==
X-Received: by 2002:ac8:5e08:0:b0:2f3:cda3:ec1b with SMTP id
 h8-20020ac85e08000000b002f3cda3ec1bmr20850884qtx.534.1652283968047;
        Wed, 11 May 2022 08:46:08 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600:5336:1ccc:fa87:21b2])
        by smtp.gmail.com with ESMTPSA id
 bq18-20020a05620a469200b0069fc55f2ff3sm1396753qkb.9.2022.05.11.08.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 May 2022 08:46:07 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	"vishnu.banavath@arm.com" <vishnu.banavath@arm.com>,
	Ross.Burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/1] arm-bsp/tf-a-tests: Add recipe to build and install
 TFTF
Date: Wed, 11 May 2022 11:41:17 -0400
Message-Id: <165228367703.3678131.4501225982666202566.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220511135231.14477-1-vishnu.banavath@arm.com>
References: <20220511135231.14477-1-vishnu.banavath@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 11 May 2022 15:46:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3387

On Wed, 11 May 2022 14:52:30 +0100, vishnu.banavath@arm.com wrote:
> TFTF is TF-A tests that runs at NS-EL2. This is primarily developed to
> test the TF-A interfaces exposed to NS code.
> 
> Vishnu Banavath (1):
>   arm-bsp/tf-a-tests: Add recipe to build and install TFTF
> 
>  .gitlab-ci.yml                                |  2 +-
>  ci/tftf.yml                                   |  7 +++
>  kas/tftf.yml                                  |  7 +++
>  .../conf/machine/include/corstone1000.inc     |  1 -
>  .../tf-a-tests_2.6.bbappend                   |  3 ++
>  .../trusted-firmware-a-corstone1000.inc       |  2 +-
>  .../trusted-firmware-a/tf-a-tests_2.6.bb      | 53 +++++++++++++++++++
>  .../trusted-firmware-a/trusted-firmware-a.inc |  4 ++
>  8 files changed, 76 insertions(+), 3 deletions(-)
>  create mode 100644 ci/tftf.yml
>  create mode 100644 kas/tftf.yml
>  create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/tf-a-tests_2.6.bbappend
>  create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.6.bb

Applied, thanks!

[1/1] arm-bsp/tf-a-tests: Add recipe to build and install TFTF
      commit: f68fa49bcae00f9aa25473ef878ef8a72e2dd41e

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

