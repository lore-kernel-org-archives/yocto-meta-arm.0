Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D4C9ECAAD3
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 19:15:39 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web10.16736.1662059736908806764
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 01 Sep 2022 12:15:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=DNomnpIb;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.41,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f41.google.com with SMTP id n4so11615009qvt.7
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 01 Sep 2022 12:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=4jQIlw6hUx+9zCc8+T4tXq9pux8aCtQiAN2QEwjr1vw=;
        b=DNomnpIbnxof/HpeRMa7/4x8hEG71Uta1mKF26LJmo/s7U/rG7UX8My9CUhpEy2Fhs
         srG55jXGQNpYOU63/hIf/Mf0V818NyQpy5ekYxCBomZ3M4ZyztRY7b2RlyECjzuCc/j5
         1IBUMNJC0E65D0iAx9pGDGlQmTdsOYYFoPjwpZEMwa+1ZMRjfwk6sxZmuHVhldSUsEXN
         716RmDTffSErM9SX3YFztIsyHnwvVjnGCLnqUupVnCXPuAfnapRyVUt+Pln8VZZzTRWR
         wXav6JjkKaNILqJ5dS4WaB5wPzXppsCYI/gMnnKrW8/VLi642aMEVW1651rdP9Y+V4Tq
         iCOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=4jQIlw6hUx+9zCc8+T4tXq9pux8aCtQiAN2QEwjr1vw=;
        b=ekdpnqPTp0eHNb0jEaPDYzTUQ7GIV+CdaSMETR64Ix08LHTAfRJEk/i0OdJEigPJcv
         Qff3mdQT+SM7kLKXLUuPV/AfO0ltDxUhdPdSkipMx9t4kaxWKFZ0TtjQW8tiwUGfzSSE
         Kwn8LxFQegCKvFf/hDw0So5Xamln2pxYFU9yv0Ode56AoPVZr15OMwnH/PlPt7+WPjot
         IKpUsuqrIqZtXEe21tsK0BMTakNEvfHO1auMzcfJbXA/xon0JWroiTQO4+9axW8Infan
         fmkXqq9Sjvdje3jZ3yZnOuS/kyz9d+++nQ0SezOHnh4WrQzvOnr78wnxgeJ2WWW3QKUM
         /JUQ==
X-Gm-Message-State: ACgBeo1devb1nd5uvxAjOjj567kd+wyLKzY6O4yMvhEKfF+s3GHcVgPQ
	gxmbRTVUbrqK7SRGOkQQoCHmz7vm5xKIIDna
X-Google-Smtp-Source: 
 AA6agR764v1fS3kt2wsR+hSQrdnlaGDIzEeAKzrGiofhhEgxPInDXy5/0n5ffYzAMVHVACb1ti8wXw==
X-Received: by 2002:a05:6214:1c87:b0:46b:c547:543d with SMTP id
 ib7-20020a0562141c8700b0046bc547543dmr25404274qvb.52.1662059735537;
        Thu, 01 Sep 2022 12:15:35 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 t29-20020a37ea1d000000b0069fe1dfbeffsm12268386qkj.92.2022.09.01.12.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Sep 2022 12:15:35 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Anton Antonov <Anton.Antonov@arm.com>
Subject: Re: [PATCH 1/7] Recipes for Trusted Services dependencies.
Date: Thu,  1 Sep 2022 15:15:31 -0400
Message-Id: <166205973133.3297044.3094454479371847145.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220831184157.84687-1-Anton.Antonov@arm.com>
References: <20220831184157.84687-1-Anton.Antonov@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 01 Sep 2022 19:15:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3735

On Wed, 31 Aug 2022 19:41:51 +0100, Anton Antonov wrote:
> These recipes produce only -dev and -staticdev packages
> which are used for building other TS recipes.
> 
> Nothing from these recipes is included into the final image.
> 
> Using dedicated recipes for dependencies allows us:
> - fetch sources and build dependencies only once and only the required ones.
> - simplify the dependencies recipes and use Yocto cmake bbclass
> - troubleshoot/fix/update dependencies builds separately

Applied, thanks!

[1/7] Recipes for Trusted Services dependencies.
      commit: 805054c292913eb52befb0f7763ef9ef905196ee
[2/7] Recipes for Trusted Services Secure Partitions
      commit: 85494c88f37b80179ad8c904fd3083cdc42e6bb8
[3/7] ARM-FFA kernel drivers and kernel configs for Trusted Services
      commit: 32e3759b0a01f727e00bb04133f624738209ac59
[4/7] Trusted Services test/demo NWd tools
      commit: 441d6f4c3f55fb3d55f7a5eb75117274650acf1d
[5/7] psa-api-tests for Trusted Services
      commit: 3076df522a3c422faa596323d2c60e63bcbb67cb
[6/7] Include Trusted Services SPs into optee-os image
      commit: 63b960c7c858c1a2d9c231d163679f8eac4f5822
[7/7] Define qemuarm64-secureboot-ts CI pipeline and include it into meta-arm
      commit: a19249a385623ff8cb599007de231ce5051ba210

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

