Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 816BAC7619A
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 03:21:22 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web10.61930.1680492078748648401
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 02 Apr 2023 20:21:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=egfPQQNJ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.42, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f42.google.com with SMTP id m6so20373745qvq.0
        for <meta-arm@lists.yoctoproject.org>; Sun, 02 Apr 2023 20:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112; t=1680492077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uTe3bqP2gspsa8hAzmysHX5X0kZ1HSmQghcgL3hGxFU=;
        b=egfPQQNJjIYCxH4LbLNnbMfp2w3rzv4uCuGGOYdF0VcJPV5+dU8d+Ju5M+s+/4Unp0
         a/jEeH2n8gqADCKQMN2HbxZCKNnFLegRrqraDYMijMVyYc8BS4yih+XOJ0Q2GWYadF+K
         p4aEcRGHV+MlGE3J65QEjpn29MUAanaNC8ZKanhS2GgW6gyAScBzNzhfFOLYzvUKiUR6
         /EFtdYpsAsZ0UvGNUqBsAbdWAzjMYyY0L395WLwpI2pWXQ5MMyQDZNAesBvEuSUa58B4
         vT1O3xw6XtashYOTWc13hYaWH7CsT9+XEDmSojwkw58DW05RA1EC7xDzNvzR8jalgFKQ
         cxzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680492077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uTe3bqP2gspsa8hAzmysHX5X0kZ1HSmQghcgL3hGxFU=;
        b=h5Iy3BtXwKPaTZ3D/9Jc593oBiEEy/syyZyI2S9W31jH33tZvNi8DoXuYY6vr2j2kq
         2DQZ0eY1WECHPzuNCE7lsbM+t32JZftcE005Dp8Xe1yeHVJI8HgA7HyqtP9eGDj/LNpn
         br+hIVmUqaP6PKbkExUn1kJpCPJTcllmGsp+Tbx70+8xU4NhiLpBU0y8cnjVQYPE1Zxq
         ab9ve6duUzbtGbQG7cZYHspmToNgzZwjorAlmDpn/+ObUNE0Sx6D+Yeqn6UfAc3OQ45x
         Jz4eSaSDqIdFVNjsVtKYy6/tpiXtxzV6+V9RnsHy7YKM4r0MyY1GR6aKvcH9uUBg4tJU
         KS1A==
X-Gm-Message-State: AAQBX9ezDYsunMsDn0x8rIjix/XK17VprUOKeDkhoJwhv4cHQLkQaMY2
	d7ni73MQvRnuzLrYeVyR5ESNE926y3UIg3xjktg=
X-Google-Smtp-Source: AKy350YPttS1LGQRedcx1HhqlQTAp8+uUL5cByS08GBxZw7UkOSUhBOgvK+ohtjQsuw4tFiiXyjpCg==
X-Received: by 2002:ad4:5ce8:0:b0:5ad:7baa:b300 with SMTP id iv8-20020ad45ce8000000b005ad7baab300mr61766159qvb.40.1680492077452;
        Sun, 02 Apr 2023 20:21:17 -0700 (PDT)
Received: from localhost ([2605:a601:a600:7900:15a6:cff9:108:de91])
        by smtp.gmail.com with ESMTPSA id w7-20020a0cf707000000b005df53bb2ccasm2303362qvn.145.2023.04.02.20.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Apr 2023 20:21:16 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH v2 1/2] CI: dev kernel allow failure
Date: Sun,  2 Apr 2023 23:21:02 -0400
Message-Id: <168049206444.2209125.450976975560441221.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230402131659.560595-1-jon.mason@arm.com>
References: <20230402131659.560595-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 03 Apr 2023 03:21:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4531

On Sun, 2 Apr 2023 09:16:58 -0400, Jon Mason wrote:
> The dev kernel can frequently fail, and is not anything that is used in
> production.  Allow failure to prevent CI issues but still notify that
> there are potential issues.

Applied, thanks!

[1/2] CI: dev kernel allow failure
      commit: 9e57aa4f501d5434c697dd350ec37870ca111e9d
[2/2] arm/linux-yocto: remove IP_VS config fragment
      commit: 3b4ab43d2f82b9db682a88dff4665807b62d1870

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

