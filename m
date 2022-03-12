Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2EB0C433F5
	for <webhook@archiver.kernel.org>; Sat, 12 Mar 2022 00:55:39 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web09.470.1647046539193157086
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 11 Mar 2022 16:55:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=SmVIbUet;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.177,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f177.google.com with SMTP id 10so6270994qtz.11
        for <meta-arm@lists.yoctoproject.org>;
 Fri, 11 Mar 2022 16:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=j2K4JjIUKLdAlsWyagqLHOOtgFSAJKLGeyG3gHlaDV4=;
        b=SmVIbUet5MykklWv/H6vh03dh91k7/wmaqBb1TcoxltKfTLBvR/5KvpeMvE6marsHW
         dwuZS3OvL8Z20gj2kDTg67x2cHfd6TaW593TelxyenKgw3XqgzKrPvTdV071lodERtlS
         56bcr3+hhmtSw6D7YhJ8HiudQy9uMFDLUnbdfMudxWgxNQmEBNwtcuYIhHROPcFgWLrd
         0otZ50qEC85JnyxUA5Z4kTABEZER6ePq35nX/8bJnV4dvTaAczn+tglR8vgupB/1nETQ
         3ZTb50rYaM+vKMK1a5FZC1zHZK9FaS8C9w9YHVh63pNRVQ+eZF3krrlOQDbCHD4cCWU/
         XVOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j2K4JjIUKLdAlsWyagqLHOOtgFSAJKLGeyG3gHlaDV4=;
        b=ZvK60H7Nozr7oT8q838DcYuX9J5rq8bHh2LrmtoZNI6V/W/EeCxwKIy2GRAMDvwNIZ
         3rSyzzq7qIKe6N6mT1iJiUEL1ZDUvXUpLapHaPSgR0KiMq+9xZeQfyX+55jMDKVs1EQV
         XWZ4LM7/X6+SYncak46sK0gmqIxbTgL0qEx76j3K9LCDE1hHw2tdPzEG1Wv7ugdYP6Cj
         JlDqm2jNC1AJiHrCOEZK3cJ2QDYCc9swxexz5YkXUaj66ZZv0QSlXf86wEvUt7/yUhH9
         p7NSWkvg8me/PmTHE/8KHHrxXB7FnyRpQEN3gudWEneSffXiO6/VFJH/VBv0lLsbYGJH
         Z9VA==
X-Gm-Message-State: AOAM533DWYSPwaqXIn63CoMV456jNFvUgD9kJLLlCuTf0jXefK6wgm5l
	lGtbPkLxcE3LmzxSUFLgSPrBXMpi3yYdGyTI
X-Google-Smtp-Source: 
 ABdhPJyRfZDwN3Fx9m4wj07UyHhbOV1+fcq2MzJJNje4Abn/QCpS75Biib2TJUhuHokby6kF0rY+aw==
X-Received: by 2002:ac8:5a56:0:b0:2ca:df90:1aa8 with SMTP id
 o22-20020ac85a56000000b002cadf901aa8mr10571852qta.686.1647046538291;
        Fri, 11 Mar 2022 16:55:38 -0800 (PST)
Received: from localhost ([2605:a601:a66c:b900:77d1:5990:d885:810c])
        by smtp.gmail.com with ESMTPSA id
 13-20020ac84e8d000000b002e068382bf8sm6967816qtp.63.2022.03.11.16.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Mar 2022 16:55:38 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH] arm/edk2-firmware: upgrade to 202222
Date: Fri, 11 Mar 2022 19:55:28 -0500
Message-Id: <164704652792.3865490.3111647604796702715.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220311140814.3406439-1-ross.burton@arm.com>
References: <20220311140814.3406439-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 12 Mar 2022 00:55:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3165

On Fri, 11 Mar 2022 14:08:14 +0000, Ross Burton wrote:
> Drop 0001-Fix-VLA-parameter-warning.patch, this is merged upstream.

Applied, thanks!

[1/1] arm/edk2-firmware: upgrade to 202222
      commit: 5b4d25133aa406986142e961b3bf003cb7883839

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

