Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03509C43334
	for <webhook@archiver.kernel.org>; Fri, 17 Jun 2022 13:49:41 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
 [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web09.30776.1655473779786420583
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 17 Jun 2022 06:49:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=LdkDEYUJ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.49,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f49.google.com with SMTP id n15so2469463qvh.12
        for <meta-arm@lists.yoctoproject.org>;
 Fri, 17 Jun 2022 06:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uIr9eB8Sjh3FCshgW+ui9TKocE7S0OEC0Yq/T84ko2M=;
        b=LdkDEYUJFDkXCokkq1LaL85ZUy7zJ8ycyXYtR73GVZaNCdnOVX8rxzdBhfm32ZZiau
         8OMQA6qMSCn2CwYmINvuqz5t4UsNxAldywns3BZs8Oeat+ddzMLZmOJxXmivJOsJgkSL
         /yt90UPS6qejyajbosxkPXhWR3AdxKhGlK7khporgNdE1Xf4PP0wxe3NSkWPKvSylTkN
         qofONJfy5XTfKnzqQhNyolpsDWoeEedULjJlUCpvoz/PxQ8EJZRxAXAYCvLVf1kgG2QT
         OK38iLvnALZ75DnvIhtXekmWBeURd4uCI5qMVTxOEw3vta6eJ6j8gq/XUCFZqzTjRlh5
         ibZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uIr9eB8Sjh3FCshgW+ui9TKocE7S0OEC0Yq/T84ko2M=;
        b=OI73PWdkU208qWYAs/Pf8IG6MgQPxL3o+mJahOPw4IQn7Z9873t7moJ/aMnJ0D7+mR
         MljS69vhDTTO2rYaunKzem2RaydoF3NggBSVLGbL8icKgQEteS3KKSodXEgy4GLDHXRM
         EK4puRwVvyAgVapVQLISjsJkaSMmZTkSeLL6VkLur9wJMYIeBM3ZcE6oq9kIQivsxMEh
         +4Wsp+bb2gZq7TElsD74B45fBaeZm1ywaw3Xcy3YbKJz/yoVNTVCpuNaM2+nqfT9N9QZ
         /7glUdVcCO6Rdx3KiNK/BpdLzAXnaDz0i/L7gJFUke7CHBOdqxJBXcLXWLS71JdDjw5P
         Vg4g==
X-Gm-Message-State: AJIora9IdG/vJagu+RrrMB6nHWOmLbWrFLXUWPetr3nKzJpbcO/dksms
	cjNQHlu5YDTPNgbNZyODcPDbHhzhbL/j6g==
X-Google-Smtp-Source: 
 AGRyM1uCM4FeMPi7Wd1k3HBoUINdtrDZ2zX2hzkqCT18yNZPMqS1L61btLQIHG21EUCMfiteaZeOCA==
X-Received: by 2002:a05:622a:1015:b0:305:2e90:587d with SMTP id
 d21-20020a05622a101500b003052e90587dmr8515900qte.180.1655473778657;
        Fri, 17 Jun 2022 06:49:38 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 bs26-20020ac86f1a000000b00304fd1f6b4csm4023257qtb.77.2022.06.17.06.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 06:49:38 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH 1/2] arm-bsp/trusted-firmware-a: remove SGI-575 workaround
Date: Fri, 17 Jun 2022 09:49:29 -0400
Message-Id: <165547376924.2518840.1320293780190686253.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220616135034.3787137-1-ross.burton@arm.com>
References: <20220616135034.3787137-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 17 Jun 2022 13:49:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3517

On Thu, 16 Jun 2022 14:50:33 +0100, Ross Burton wrote:
> The SGI-575 build is successful with branch protection enabled, so remove
> this workaround.

Applied, thanks!

[1/2] arm-bsp/trusted-firmware-a: remove SGI-575 workaround
      commit: 60d9cb303d4f08ff5b985a744e9977ac6a03568e
[2/2] arm/trusted-firmware-a: rename to 2.7.0 to match upstream
      commit: 391ba0be671ed16e9c7dbb51e7720bec4ad4cdfb

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

