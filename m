Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08115C433F5
	for <webhook@archiver.kernel.org>; Wed, 23 Mar 2022 13:32:10 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web08.9098.1648042329250696050
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 23 Mar 2022 06:32:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=rwhvTo+P;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.42,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f42.google.com with SMTP id kc20so1188068qvb.3
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 23 Mar 2022 06:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=e0WZWOcPxevEZqzv0Lu4ixUcB2vLfHmBXsyvngWm8lk=;
        b=rwhvTo+PdMQiGN5Rnup5Pv7etf4ggLwN/0Pv90R/bzstKDTmGcTc6ThYX1IRBrSDgV
         Ry78p4rjbQqH8eSlYCAJek0oganN45dDA/yjTTvUgcyGiTsFnKyJIgxWTqOgTIe9iYkG
         iVUHgtpA+pWYLRYa+m0Tx3J/MoMueJ4AvoDCxTZrY4OSs0vJ00kpQjojypKrOh6aVq+V
         WOlbb410vQNizXLp3F/UOwvvj6XUHqd29Ini8o214xsXRuITSgQqs+JbWZBraeOiF42m
         TN8bGyhpUfAqVlX+9AKnHr0H06cQueO5kbv9CuaR52zxfeDFN09qQTIrN/6iJz0dmw3S
         sTqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e0WZWOcPxevEZqzv0Lu4ixUcB2vLfHmBXsyvngWm8lk=;
        b=JPyrUI8wBMkW7olmTIWXbabI4x8na48opLGqcX1ZbwJlcwX9RpQpquLJi/VUavvaEe
         jGVBRt1Y83WfNdR791KFkzUSbh19yeE8mKT56Go7Y17OfhxFKhcfyq/BUVxC+hNdsQuH
         UHlGAEEB5TF7yrzVMuxkB4mH12hgz/2JEwBxfGfx3rQOiIzf2hBcxLWQHBi08YIpJgpv
         wQ9RI1fkgiGvga8GcsWbRnNtg5aRnmENQBUHEngUNMu7RQ4MRaGzARYVLxYXsmQ+rDzD
         8z+uRFrPMCyRDHzRHsxsTUP3X+Y72GeRc5q7Zp/ZxgVsfoxCVeKSwgIlonFtDPFo2Nzg
         xeLw==
X-Gm-Message-State: AOAM532j9NIvOvXz/Ft/EqLU0lzp02O6/JTVQqGrpNTAXveChirHj1kq
	6+F4khjda/qUdWJZ0OWZzjNB1V+63/K58g==
X-Google-Smtp-Source: 
 ABdhPJzj78j5Q9g2j+GvixsuFCJqKCKY47LJhit+0J4mZDgVvgg8l/74DTX0II4A2Ld61v8FButPkQ==
X-Received: by 2002:a05:6214:1c84:b0:432:6dd5:ba71 with SMTP id
 ib4-20020a0562141c8400b004326dd5ba71mr24063041qvb.109.1648042328038;
        Wed, 23 Mar 2022 06:32:08 -0700 (PDT)
Received: from localhost ([2605:a601:a66c:b900:3b2f:a3a7:b707:646])
        by smtp.gmail.com with ESMTPSA id
 z19-20020a05622a029300b002e1a763dac1sm52463qtw.9.2022.03.23.06.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Mar 2022 06:32:07 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	ross.burton@arm.com,
	"emekcan.aras@arm.com" <emekcan.aras@arm.com>
Cc: Emekcan Aras <Emekcan.Aras@arm.com>,
	nd@arm.com
Subject: Re: [PATCH 0/1] arm-bsp/corstone1000: remove the need for
 meta-arm-image
Date: Wed, 23 Mar 2022 09:31:18 -0400
Message-Id: <164804228335.3978431.15048975092470328071.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220317161033.3099761-1-emekcan.aras@arm.com>
References: <20220317161033.3099761-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 23 Mar 2022 13:32:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3199

On Thu, 17 Mar 2022 16:10:32 +0000, emekcan.aras@arm.com wrote:
> This commit remove meta-arm-image from the yml file and adds
> necessary image configuration to meta-arm-bsp/recipes-bsp/images.
> Signed-off-by: Emekcan Aras's avatarEmekcan Aras <emekcan.aras@arm.com>
> 
> Emekcan Aras (1):
>   arm-bsp/corstone1000: remove the need for meta-arm-image
> 
> [...]

Applied, thanks!

[1/1] arm-bsp/corstone1000: remove the need for meta-arm-image
      commit: bc278abe27838064b3e36398808fa4ce5ee40d21

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

