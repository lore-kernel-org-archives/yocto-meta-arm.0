Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 697A2C433EF
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 16:22:18 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web11.10216.1646151737680860097
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 01 Mar 2022 08:22:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=BLLZ+RxN;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.170,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f170.google.com with SMTP id n185so13316622qke.5
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 01 Mar 2022 08:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Kin+M9MlJAfTpRJxVYvcrdDA7Rx8XmOZgr6/BvWCWGQ=;
        b=BLLZ+RxNKVndQskfLmHO+4SHDVqNQWUJl+HL0kuJbt+G5evsk7zF3+n0LaKCBIYzX8
         sYD5CmeVLOiojt23pVYxENNLQaV1By80EJDPLiE1TEpy4UlrK0l+upKKFabr292XjxtR
         C1Tj/6rL8rWbvgZjNej8YkpoOp2IMdE9sGXBMUs48nAtFDn6kcBqPYZloy+infMLVTDP
         gwtVDhq4Tfy6ThwmrgTqTTsVjMY03hAUOgn9r/ngM4q3sSsOOnA99+cRids5LVz0cTKS
         g5c0rooW5lnjbao53bybeDm5J8C94UMniiFMVopxrzNgIw0ofWqyRQlFtfenXQQfJq6W
         q+QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Kin+M9MlJAfTpRJxVYvcrdDA7Rx8XmOZgr6/BvWCWGQ=;
        b=PyfBFfBlzowKKPVyZqtOl7S6qDKT9TSVgTpCgFJNuaoSrJEUnkcEDA+73WxOGgFRCV
         ejwX8SNOoR9+zXxu++eRVRRVlktREMIYPT+YOlecVOfjEy8b6B1/MnnwMCqyDvx46a9a
         YJHYSkms/Qqg8ivTaA8INnKdJuj5PZQSMNc+jxWM2OBY/ye7+4tAsDPa9mBD2gHYpF0x
         /sjELBwuyYP8C2pQqHj+mPw1iYNqlaNnw74eap1qXGnhSpi7UzOFhn7b59esTY0WvSlD
         +jTaXYrHIKUPPkEtp4vG83Bp6Kw40SfFZgo+X73wnnoNHwvlblwsezU7SGvj9oPqE2gt
         qHhA==
X-Gm-Message-State: AOAM530Lr1lJ+OajzV2Ikr9kDxrPWOcxrvMrHWo/QwT1sS/5r+9YOvn6
	3omlihu/l+yL/hnaVcF063bfSMkOUAuDJg==
X-Google-Smtp-Source: 
 ABdhPJwK0jw3SYJnb8BB/yCUb7mbGQ1B5sEF93x5zRYj2/kpexAgIWp197z20lBPWliZy1jsmYwYdw==
X-Received: by 2002:a37:2ec2:0:b0:47e:cdef:3e1e with SMTP id
 u185-20020a372ec2000000b0047ecdef3e1emr13830723qkh.125.1646151736338;
        Tue, 01 Mar 2022 08:22:16 -0800 (PST)
Received: from localhost ([2605:a601:a665:9200:21a7:7bac:7802:e911])
        by smtp.gmail.com with ESMTPSA id
 a143-20020a376695000000b00648cb6bb2ecsm6772678qkc.54.2022.03.01.08.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 08:22:15 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	"emekcan.aras@arm.com" <emekcan.aras@arm.com>,
	ross.burton@arm.com
Cc: Emekcan Aras <Emekcan.Aras@arm.com>,
	nd@arm.com
Subject: Re: [PATCH 0/2] Corstone1000 Upgrades
Date: Tue,  1 Mar 2022 11:22:03 -0500
Message-Id: <164615172479.2923434.1782407418611426663.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220301101609.40783-1-emekcan.aras@arm.com>
References: <20220301101609.40783-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 01 Mar 2022 16:22:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3085

On Tue, 1 Mar 2022 10:16:07 +0000, emekcan.aras@arm.com wrote:
> Updates linux-yocto and Tfa SHA to remove the patches
> from the recipe since all of them are upstreamed now.
> 
> Emekcan Aras (2):
>   arm-bsp/linux-yocto: upgrade corstone1000 to 5.15
>   arm-bsp/trusted-firmware-a: corstone1000: update Tfa SHA
> 
> [...]

Applied, thanks!

[1/2] arm-bsp/linux-yocto: upgrade corstone1000 to 5.15
      commit: 81193d97adaf8be886c4bc6bdbe4ae73ad65b7f3
[2/2] arm-bsp/trusted-firmware-a: corstone1000: update Tfa SHA
      commit: 24db3b56ba1285e4196da9416a8914c5bcaf8fd4

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

