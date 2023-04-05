Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55ECDC7619A
	for <webhook@archiver.kernel.org>; Wed,  5 Apr 2023 22:28:21 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web11.144796.1680733699555382910
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 05 Apr 2023 15:28:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=aXEMGyDa;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.41, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f41.google.com with SMTP id nc3so9984864qvb.1
        for <meta-arm@lists.yoctoproject.org>; Wed, 05 Apr 2023 15:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112; t=1680733698; x=1683325698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Ahaz8h7FlkJLPaHY0/TKD/L8KBgEysv/oNez79SKr0=;
        b=aXEMGyDatMLBhHRQIVjbd/LToyXJHoazp8KbrwKzcp2iQIrLyMc/wpMOgg8S/ci2Xi
         j+5M1/zFt9aQYNlksxF9kAMdtZdsGSjxVBqNdt2xtIBDv4MJgfuw5Zz3xBCfijpzSqOJ
         ElMVqWW44bvYb6QwTSFf1J/nnJuhwqzDPHyh7Mek6a5wtXNfxCGVXrx4Mpp8dQjkaOGw
         szaFpJkAvEIH3OhD7i8Nu7MTHGzCpoJB9oTq/66LSYWFLMDZWX7Z8jR9iXmQW5l8UdUe
         XWRO1P0daMjPex7OC7ox0GE0wta+zkXkxpIKDd+PpgcjOa2HA9FVJgvDLyrjM1BwOSTZ
         TreA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680733698; x=1683325698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Ahaz8h7FlkJLPaHY0/TKD/L8KBgEysv/oNez79SKr0=;
        b=mFMW+j43iKin9mU2zDtbt7t95A3nHaMc2iXpy+xsfVYMvVcy2X2utTO/5A7JD4MQko
         AhMbNsj9F+znh+wol1VKyHixapP9x/698O97vvm4uFm4zOjndtk3NboQ7Y7nptQPA78C
         +pYDH+tVoURtuYfdbDJ67Hf/XCUG0CM8nEQV+labmZ7gw8m7FxorXO6sBaNs6bOGYVvU
         itFAaoMYVdbjZu3LtMvXbfK1nmWfU5a0zxCk3lyvm/oVZO2N0NXC006jUYfNXNfEf8sK
         c7hNQHPnsTomeitxd2d3wXyo+4zcrn35zePf/YrSni/dad6Oyk7Zxjj2vlG3rfST46y5
         us9g==
X-Gm-Message-State: AAQBX9d7tlHH4XUdHT4P5Jrwz7s79x1GZQw0kJ4YDP94Upp5ygGJcaGQ
	5WH6eLgzK+GvePRCrSrgupZJyrQrO7fDb4rJNkY=
X-Google-Smtp-Source: AKy350Z4Gex56uhGvvUpXQxOLKln0Q96DHZ1CAcnp048pPETpE6u9vLy488tgpnLKOxAQlEvEww1QQ==
X-Received: by 2002:a05:6214:238e:b0:5d5:5c9a:77da with SMTP id fw14-20020a056214238e00b005d55c9a77damr1096586qvb.37.1680733698269;
        Wed, 05 Apr 2023 15:28:18 -0700 (PDT)
Received: from localhost ([2605:a601:a600:7900:15a6:cff9:108:de91])
        by smtp.gmail.com with ESMTPSA id b2-20020ac812c2000000b003995f6513b9sm4286680qtj.95.2023.04.05.15.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 15:28:17 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] CI: update to the latest kas version
Date: Wed,  5 Apr 2023 18:08:35 -0400
Message-Id: <168073252006.3261602.8104420993454895701.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230405153011.567670-1-jon.mason@arm.com>
References: <20230405153011.567670-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 05 Apr 2023 22:28:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4548

On Wed, 5 Apr 2023 11:30:11 -0400, Jon Mason wrote:
> 


Applied, thanks!

[1/1] CI: update to the latest kas version
      commit: 8acd61c427bc13024df59cdf3d8217e6e2bd2ce4

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

