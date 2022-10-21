Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68AAFC38A2D
	for <webhook@archiver.kernel.org>; Fri, 21 Oct 2022 22:07:30 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web08.672.1666390040008280750
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 21 Oct 2022 15:07:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=wc6EKwAa;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.53, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f53.google.com with SMTP id e15so2642643qvo.4
        for <meta-arm@lists.yoctoproject.org>; Fri, 21 Oct 2022 15:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l5nnNWyBZ5hxeI01MHGvLUvDcWO0zCfXMhr0JuimDmA=;
        b=wc6EKwAaCGQHWV29bKmp71cikWfQes6Z967ohdXAFn2kf7PNwiS6Iewpq/nsh6SEUR
         aN5+wO/XJQ6S4CqPHn1j0ajGzo8aGnrXucAvM1eav2XVOiYc/5C+OhsGKb3yeCVrDLrq
         86waoLpQ26hGHjxHHAz9HpegXjDbHtQWHwOF5yyMpAAxGhxnjf2n87w65c02Sb6pgXaE
         H+FGC3CEzeHzeQxOmdJvthYaqXBXCuYUQWS1/ukbtNfb2/SUUGBACWZQ465bUw/nFeqH
         AyADvZXwyp1MiYWeOPBR0s6AQlGFVLNlCSCjmPujtRqMP+7r+XqaaXyJHNHbUfSZR9Wf
         5XHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l5nnNWyBZ5hxeI01MHGvLUvDcWO0zCfXMhr0JuimDmA=;
        b=pP2XEvKPeHpvN4vobTqi2/6tZZnqSxK79KaNkFOvJww6EMkqKidSz6INQIpFGRuw1u
         N5dFK1C4PQguaSnsOM6xA7Nq1YVtIfVMIUnRmovswc8QfB6pNcCBC/0KVQ2FzuxW7beJ
         VrxCNglnxTYpG1yj1T2R1SaSay2dNl1S+mSk5m+5JMCwWc08Clif9rF7dbWp8d11oiP+
         GGcv58nDj7j8Aprei+8Tu/noa4z1N5skAIMBgiN+9wuS5PSAvKdvgRGsptEDIZBt9UmO
         vl2blowAfWsPFZo8ZTQSGBsrr1TSXhUk+Rq3Lp/AXAzUw7t3KALfA8x5okIocs0zfqaI
         z+qg==
X-Gm-Message-State: ACrzQf0Je1VXCrLGfdbuiwK0nM6BKkheXd0VbuaW1JUqNauETCiEPnod
	zEVRNeDNGsrwwcZ3z42k0d+1+ujdtK27Bg==
X-Google-Smtp-Source: AMsMyM5H2bih8ViBRzb9rXBx1dmqtYQASAtWhEzl81mwOWAUTZnqbiEXaLIoaQYcRIvR17UDRRN0vg==
X-Received: by 2002:a05:6214:d4b:b0:4b1:80eb:64e2 with SMTP id 11-20020a0562140d4b00b004b180eb64e2mr18752254qvr.123.1666390038806;
        Fri, 21 Oct 2022 15:07:18 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id bv8-20020a05622a0a0800b0038b684a1642sm8763435qtb.32.2022.10.21.15.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 15:07:18 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] CI: track langdale branch
Date: Fri, 21 Oct 2022 16:01:41 -0400
Message-Id: <166638250645.2629587.12590980108245029851.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221020140238.6982-1-jon.mason@arm.com>
References: <20221020140238.6982-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 21 Oct 2022 22:07:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4007

On Thu, 20 Oct 2022 10:02:38 -0400, Jon Mason wrote:
> 


Applied, thanks!

[1/1] CI: track langdale branch
      commit: f83c5ad19e27860f5709cea281cd4d4454f31f26

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

