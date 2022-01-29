Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93A55C433F5
	for <webhook@archiver.kernel.org>; Sat, 29 Jan 2022 04:30:51 +0000 (UTC)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com
 [209.85.166.42])
 by mx.groups.io with SMTP id smtpd.web08.2477.1643430650387867754
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 28 Jan 2022 20:30:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=c8o6uWYm;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.166.42,
 mailfrom: jdmason@kudzu.us)
Received: by mail-io1-f42.google.com with SMTP id r144so10196555iod.9
        for <meta-arm@lists.yoctoproject.org>;
 Fri, 28 Jan 2022 20:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=l0Qy2PN1M9c6kJ8LIc1xSJWfLw78Te51twdWVgraYa0=;
        b=c8o6uWYm+z1ViwMaZRb8o0hb9qY64bhWQo9wBpMozXtR+CL5PfsPtxtFcI59IVntHO
         DK00cO0Qby6pg74PiQdNPVhfEKoRQeVgaiq6+mHqDk4UQE8QjZocF8hdco5+w2VsBUOk
         eO0EVdDr0Rr7lhGr2LRFrI0xQxGDRf4YCO7EThpEjU6g1dCuPlxnF3MYUbp9Wxgbddup
         8UsHBMYutvcYwtGJLNisnA50Sg5ZLDXliSmhQ3/QbiVo0EHXx+AKJ8dOP6BxTdPSCHfl
         2ScxzxwLu2OLhgf+gtKFirwwh8RycphMyMtuZ9k7enWug1Fs2IU3wXLVok9P/CoNYKVb
         LzIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l0Qy2PN1M9c6kJ8LIc1xSJWfLw78Te51twdWVgraYa0=;
        b=B32WZ8HMRTGPjbaFJ5SakaP9jjTlxVMOKyf3Lg8BFwBEWhWdMhz6ZVRr8cierQepPO
         HJRleXgo0WBFkfynLl0t65eRJSuK2iLNc8ZYL3vzCaZB/TfEyoxCwzE8MhRMiWlM5UQl
         k0duqdetw0GGgkcYrYeAP4l8uEw2XAwppJWY5/ejOJRq0OICmELbX9UBjLOQee2kp7Om
         ZbjsrWhRrErDCsqLmm6HRaVyXLFtPHCvh+C4fe7/wLODi02KEABMOYIffpqYdVg8Jhl2
         aEw8far7AQ95lruEAdV1wg4JVmeH90K7evuwRKfe/366l+4iyY5jzb981GgR8ErTHRv/
         Jsqw==
X-Gm-Message-State: AOAM533QU7IeTh1587REBlYki3Itup9fBAf7EF7I2jgIycnADISZhvtX
	X0tDN/5iUE6chNQTghvZnSzRy81C0d5Xcg==
X-Google-Smtp-Source: 
 ABdhPJzrE/RxRmPigE5ITnVbuzcNpfnnvXIwVZzvUKQ1aN0bQvCt5hO0yDzvyqEAdM9VkEVj1gGgCw==
X-Received: by 2002:a05:6602:29d0:: with SMTP id
 z16mr6890295ioq.122.1643430649665;
        Fri, 28 Jan 2022 20:30:49 -0800 (PST)
Received: from localhost ([2605:a601:a63c:b500:be14:e8d7:55dd:a892])
        by smtp.gmail.com with ESMTPSA id
 y4sm14586422ili.26.2022.01.28.20.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jan 2022 20:30:49 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Diego Sueiro <diego.sueiro@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH] meta-arm: Make generic-arm64 kernel cfg based on
 linux-yocto standard kernel type
Date: Fri, 28 Jan 2022 23:30:43 -0500
Message-Id: <164343064298.3410352.1724274890060392771.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: 
 <b0f55d0fc4ef33c8b24b658a8829d88646ddaf36.1642172230.git.diego.sueiro@arm.com>
References: 
 <b0f55d0fc4ef33c8b24b658a8829d88646ddaf36.1642172230.git.diego.sueiro@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 29 Jan 2022 04:30:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2934

On Fri, 14 Jan 2022 14:58:02 +0000, Diego Sueiro wrote:
> By having the generic-arm64 machine using the same kernel config as the
> linux-yocto standard kernel type, application layers can rely on the same base
> configuration, independently of the target machine.
> 
> Also, the kernel-yocto.bbclass searches for .scc files in the FILESEXTRAPATHS.
> Hence, we don't need to list generic-arm64-standard.scc in the SRC_URI.

Applied, thanks!

[1/1] meta-arm: Make generic-arm64 kernel cfg based on linux-yocto standard kernel type
      commit: 9653e905bdf05ac30d15fe81ebf71536d745e2c3

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

