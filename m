Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AACEBC4332F
	for <webhook@archiver.kernel.org>; Mon, 16 May 2022 16:46:16 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web10.66.1652719571833246896
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 16 May 2022 09:46:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=t9elfNwH;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.44,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f44.google.com with SMTP id dm17so3646859qvb.2
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 16 May 2022 09:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PEO633R+pRMQHyFEuTfITIqFtTw5O9TABnZGgTzRCLs=;
        b=t9elfNwHnalq0S9JWxDpABOnTbFM3MfDMqHOvUhdy1NU4IR4zemPhzKB6Qao5Y3FiE
         lqMINCi44fnMrm4eVdMZfmyR9BkJnEpvQdZNh/TbGsNnzL5W5MeFSzjVQi0d9YCXdqIQ
         1YJ4ReeTS2V58tzdMPiDXH7RzvcXx4dDwRJXyNAtDcKsy04LwcokQUhuG0iqe5CDZg4O
         W0inx8SfqYyKTRHJhfZ5aY/lkP/VfHMJgHFf5GGkesnBU+UJ47bZQCFOHyfHWtAbWX7C
         xZaPEDWrtZSeMQJJJBDv6gP3cbYwF+oK/Rh4KcWFy/IybJaWdwDCrInslYgm7Q8Z03Ao
         Tq8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PEO633R+pRMQHyFEuTfITIqFtTw5O9TABnZGgTzRCLs=;
        b=CB/mAtLOoScd1Se+Uv1AhMgrzcvnUVbZXWeoyW3UeHnC91cbCZsWCuVFzlgduZz0QD
         eMMwPeTzhqx1zsWcvmnEu1jauo51FzBidUJj0MYv6xyvOQ73O92yCKIvuZEZtpANC7SZ
         0J/RBcs0cN4Sn9wnvIyogm8jWILOCha8jypWJjY5L6NTpsYtbFEslAv7hCawN4VIQk99
         b5qRPHwi0p1S+w8x4oWb0Chpr7Ne3/WtSEVlvqCO/or5qBMXsDvHRf4V/iibYFo49fc7
         hLl+0REQOMeTLM+10GAWhpT2WqlYNDIrzgLBFuzKeuKZI6preYxRZfo0mhfIcE0YXm5D
         C+uQ==
X-Gm-Message-State: AOAM532tEUsw9RJTyKeaLCNfNUDT1qS3/AxGfsxXWDtnMKqnjA4EOV2a
	1UEiCFTRmTZCJWpKRnYD9WI2+GIu6RiSzj9k
X-Google-Smtp-Source: 
 ABdhPJy86MG7vLG25V0dixTJv4I4dad00eqQ7pXJF/WrUnIcmFe/xEt3ybA4TvIWKRkUl9v7qGtBaQ==
X-Received: by 2002:a05:6214:2245:b0:461:bc38:1f7d with SMTP id
 c5-20020a056214224500b00461bc381f7dmr9806366qvc.63.1652719570815;
        Mon, 16 May 2022 09:46:10 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600:5336:1ccc:fa87:21b2])
        by smtp.gmail.com with ESMTPSA id
 bi4-20020a05620a318400b0069fcf0da629sm5940109qkb.134.2022.05.16.09.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 09:46:10 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH 1/5] arm-bsp/optee-os: set PV correctly for the
 corstone1000 build
Date: Mon, 16 May 2022 12:45:47 -0400
Message-Id: <165271954727.1467292.9236366455611641909.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220513141231.2513449-1-ross.burton@arm.com>
References: <20220513141231.2513449-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 16 May 2022 16:46:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3411

On Fri, 13 May 2022 15:12:27 +0100, Ross Burton wrote:
> The corstone1000 build of optee-os has a bbappend which uses a specific
> non-upstream branch of optee-os which is actually based on 3.10, so set
> PV appropriately in the recipe and update the PREFERRED_VERSION in
> corstone1000.inc.

Applied, thanks!

[1/5] arm-bsp/optee-os: set PV correctly for the corstone1000 build
      commit: 4b94d77f693a0d21d01eb287d5a9757ecb5122b0
[2/5] arm-bsp/optee-test: clean up bbappends
      commit: 6286e0d54cdc6edf9e1d03019fd9e0440f0d546f
[3/5] arm-bsp/optee-os: remove 3.16 bbappend
      commit: 7e09d10e23f4bd92ab0d559e8c84b32ee949fa22
[4/5] arm-bsp/optee-client: remove bbappends
      commit: 155a2f9ed4ff26d95ca0228d8d069062ac5bb4e4
[5/5] arm-bsp/optee-os-tadevkit: remove unused bbappend
      commit: 79a20dc1d76fbd983365c29063eca64872b8ab1d

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

