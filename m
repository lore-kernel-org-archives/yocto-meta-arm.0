Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2DE0C83F14
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 22:29:41 +0000 (UTC)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
 by mx.groups.io with SMTP id smtpd.web10.3929.1693434577505816979
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 30 Aug 2023 15:29:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=sINsXV0J;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.217.41, mailfrom: jdmason@kudzu.us)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-44ee7688829so126303137.2
        for <meta-arm@lists.yoctoproject.org>; Wed, 30 Aug 2023 15:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1693434576; x=1694039376; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KC18NqN0HV0WZrBwFcHgOQsKPWsnPApo3UGnyrDVLCQ=;
        b=sINsXV0J18jEHtGHOQ00/Tx4DaP7i8Cs8l/8+oza7LWPce565RGVq8Qk9vpgVEJipn
         PzVE3M6i0TgcFThEMsFcz51Pjs7/h834KyyGMq0Da95FUGLb3WLFaPff1nTcz0rxXQUf
         DMOex672BHVMSkIf2ljj2RFaEp/Kg/HIuUpPl6rbkllT6/2FvoVBveaoLN0FMLtNZgSR
         6Bnw7ApN5ytvn2lzgKmyN2b1NO81VydxwoZ9+ZnWGJAspgm4U44HV/GME9Pp/OvXVque
         aLMQz3GFrpbmjzTl+qZRejFXQu5C+z3ZfrPnEN8RU5zzsPXTVrKDvX+z7eeVWSUbzThq
         C86w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693434576; x=1694039376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KC18NqN0HV0WZrBwFcHgOQsKPWsnPApo3UGnyrDVLCQ=;
        b=DxX8t3Uu+44ykGvbhEZQW4S9srBMQtKslUS1xg8D0u1vfTfxp8Dxz1R/cb90GDVDql
         zlmi220x3JcFaO5k+qu5Y5SS+tWRpyD7e30IJioCiE+wKgSiqAdklTGtznNUYt7lWE6f
         NvZdVSKYHvs+o+Dl8dX6VmgAqSy98i47IuNbomoL1qf+fWaOghp5q2oRNZUV4m/Bgwkq
         +5Sm+ZF9SL58a9xGiUWOXir96KZoyTENrh3/QmIyZmCMcbUVU8lXTmolfuCuITHsTUyC
         t8/CHm3tzgW2FRh/hs4EY/z6Tpd3grS4Qug9AgFgqlbKcX++q8Ciy6S6ZR9x0DI9cj9e
         4+nA==
X-Gm-Message-State: AOJu0YyjnSnifKbo2RPCZnJAJE48mle19BaMXNv8gm1IxcADsBe787yB
	W4Pxda8AbkkG6pRZD0rkbbZ7suDm+QIv3MS+iJ0=
X-Google-Smtp-Source: AGHT+IFeLj8sUR5KxJHgP6eORmWMwuy0wlcQoiTwCdNhSHyXMAhObln2w8mQyInrdD+ldQfQpyi4gQ==
X-Received: by 2002:a67:f8d6:0:b0:44d:5104:ff2c with SMTP id c22-20020a67f8d6000000b0044d5104ff2cmr3200967vsp.26.1693434576067;
        Wed, 30 Aug 2023 15:29:36 -0700 (PDT)
Received: from localhost ([2605:a601:a68d:9800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id r5-20020a0ce285000000b0063c71b62239sm24795qvl.42.2023.08.30.15.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 15:29:35 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] arm-bsp/corstone500: removal of support
Date: Wed, 30 Aug 2023 18:29:10 -0400
Message-Id: <169343455401.120020.14049733750045305829.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230830183739.3694370-1-jon.mason@arm.com>
References: <20230830183739.3694370-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 30 Aug 2023 22:29:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5008


On Wed, 30 Aug 2023 13:37:39 -0500, Jon Mason wrote:
> corstone500 is End-of-life'd (EOL'ed).  Remove support for it from the
> tree.
> 
> 

Applied, thanks!

[1/1] arm-bsp/corstone500: removal of support
      commit: b8367b72bf625fd2bc4a1e414356fa4d92761913

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

