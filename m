Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E7C0C433EF
	for <webhook@archiver.kernel.org>; Fri, 11 Feb 2022 15:49:53 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web08.8881.1644594592604294171
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 11 Feb 2022 07:49:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=lCkFfnA6;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.43,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f43.google.com with SMTP id k4so8847980qvt.6
        for <meta-arm@lists.yoctoproject.org>;
 Fri, 11 Feb 2022 07:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=r7YHNG4gii9qP0Y/Jmnuc2g+Gyuvq7Dx4pTULvJcYp0=;
        b=lCkFfnA6wiJNiM6YwOSdI1okl+S/XW1h+MvaGKWDLbKIxjvMupg06ZNx/49Qndcu5+
         07DeQkFOprziDTdmJPfkJHdrV65j5aoYmZaMqC2vXu5/zO/AlYluSdLAxy43A++g8OU5
         n2qfjd8c3FgAuLCnunwVbm1KJO6MdxTUqSgOmHUpJV15NpSDFGN+2zgAaG7JusTjZCBo
         QJy+VsOiXC//KP99ruAt3USGWDFxWm73OGNxe6JijPi/9XSL/NB3oqThu/kCTEkPSYHh
         D6Ev9BUoTCk6YMyoxwaj0qvfI3XzwHqWQLfGOuHhqxD9ktii3PzYvlTOzgU8hcg7e6UF
         4uXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r7YHNG4gii9qP0Y/Jmnuc2g+Gyuvq7Dx4pTULvJcYp0=;
        b=UBm1EGb6olCvvcHeiGtA7sZORHihFHXhBguOuQBb4bh7vRrhGbY7S6eLTBrUePtfNw
         m1Kp+RgyLt/SWuv/wEk7tcSvQ3LXeMmk4qVuTShKkw4YFc97AKwOlZQ1ILVi5ldILgEA
         +qOUATQ/z004fje9vPXRbYlFWHaNIrgnTVMnFtLW8Y10iX8bLQRBe+FgjgOV1WmZ3g1u
         DkR0i9eg/Ly/ndvPr6WfsRc0xqJtXK84OjL4KK41OzixmR0I5L2J/+VoBOzajEfVsBhu
         zNeFYFqhkHs83IYS645Vkf0cce7Q9z9WFS9DMuw40xlTema/6VX8AMk+JDLR4c4y0gqV
         Ga8w==
X-Gm-Message-State: AOAM532Viyh1uL+iCumeUp6dPTf46w/a53GpTwOFqCgBitcuzLNH8ljt
	5GYi/8wRlviT15DXyy9ayeEU605EqZ1eww==
X-Google-Smtp-Source: 
 ABdhPJx7A4dMjMZZlaKG8Ed4UVapwxQGJp2bwabLcW3Qma5+pbJRgkoiPhjIUYtfC6VZgzy57k/+eg==
X-Received: by 2002:a05:6214:2e1:: with SMTP id
 h1mr1474227qvu.90.1644594591639;
        Fri, 11 Feb 2022 07:49:51 -0800 (PST)
Received: from localhost ([2605:a601:a665:9200:6bed:1ee8:a843:e258])
        by smtp.gmail.com with ESMTPSA id
 c20sm13050005qtb.58.2022.02.11.07.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Feb 2022 07:49:51 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH] CI: consolidate target in meta-zephyr.yml
Date: Fri, 11 Feb 2022 10:49:19 -0500
Message-Id: <164459455940.4074336.14622128018245753474.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220211112035.2486405-1-ross.burton@arm.com>
References: <20220211112035.2486405-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 11 Feb 2022 15:49:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2995

On Fri, 11 Feb 2022 11:20:35 +0000, Ross Burton wrote:
> Set a default target in meta-zephyr.yml to avoid duplication now that
> most configurations build zephyr-kernel-test-all.

Applied, thanks!

[1/1] CI: consolidate target in meta-zephyr.yml
      commit: 4ccc5638b5dd610dd427b2359a95109cf8c17d2a

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

