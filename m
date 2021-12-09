Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD179C433F5
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 13:22:58 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web09.11498.1639056178114050159
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 09 Dec 2021 05:22:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=gDBiOOxe;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.181,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f181.google.com with SMTP id m25so5206211qtq.13
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 09 Dec 2021 05:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=x7bhcU4TfAbGvQON2w64Rekp4WPps3/KLWcZZA6gesA=;
        b=gDBiOOxelv6CjZgqCs239VFJCWtreyEVJw88CMmUa79Ig+gHyAyWIWxUKtVOVclqJA
         4FrQ7cW7BpG4Uj3t4bZdc8hRnVAgnoVuvIrAej4WjlaGGF9XbGEfOCVnF9Qh+ozjTr5o
         UbOJYZLYJAOHNcaXUupAn1CcgJhuA0gNm+SIzKrEXZtKom/TBJrmB6iA0c00wnC71fov
         qzAgIgcOgQJzPfo3Ez3836Ya0ms3oUltDLZfDUO+DCix9Rq1j+fSCYNTa163rixL8hpb
         TX5Nl/7pyOw6x+b9vr+4MbeeaGqixuh3OYIekjBP2tK6xJwJKjmxd+r2PF6SuTPsRmgP
         ecqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x7bhcU4TfAbGvQON2w64Rekp4WPps3/KLWcZZA6gesA=;
        b=0R4B9FLp86C2iVMhjZo0xXqFEyFUZXqQOSPaSVqiuHJQ7HsBdWXlIKdzuodWbvg8No
         lNHFTVRo84uMdMzRUqWTLXKp1k+nu4Z+6LFcTfnEJNd6vfcQx4Ua0MjXVAuyQEt8QbB4
         ZngFhajjcZZnNpL3ju1ANzCB+ZZAEsK125eAvMtGIdP2xhSBXu9S4Sq4tCzoaf6lb3By
         aCP0JcigUGviVLJKKK8jLiekKnNev/HLi+d2NHIH9Z/jQSbvEEnljOA2+GGm+MBDbjYo
         uaNatdBQHgFQTzpw3lCsfG3fRyteezmT4ju5KshsI+2dwidZrrX8IJGvOHxqhJipLXGy
         ZF+Q==
X-Gm-Message-State: AOAM530wS3hoq4k2eis97PhZ7Ii1WfS6LTw1GvC9J7/c3lDci1Quy6Xz
	DlStAkKjkFCm87RGYjKGUNznZ2VHA5ETxg==
X-Google-Smtp-Source: 
 ABdhPJxA0/nm9QbdkhT9oGy3Zv9jFbVU+wVo0MBWy7ZGLcJft8yRxf2ZRZhRrFg9qGMGty7r8ow0TA==
X-Received: by 2002:a05:622a:1a05:: with SMTP id
 f5mr17216341qtb.283.1639056177008;
        Thu, 09 Dec 2021 05:22:57 -0800 (PST)
Received: from localhost ([2605:a601:a626:6000:28c4:a17f:5953:8cab])
        by smtp.gmail.com with ESMTPSA id
 s2sm3845941qtw.22.2021.12.09.05.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 05:22:56 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Khem Raj <raj.khem@gmail.com>
Subject: Re: [PATCH] trusted-firmware-a: Pin to use gcc for now
Date: Thu,  9 Dec 2021 08:22:51 -0500
Message-Id: <163905617156.9690.12725494439040443724.b4-ty@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211208205809.3079680-1-raj.khem@gmail.com>
References: <20211208205809.3079680-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 09 Dec 2021 13:22:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2580

On Wed, 8 Dec 2021 12:58:09 -0800, Khem Raj wrote:
> 


Applied, thanks!

[1/1] trusted-firmware-a: Pin to use gcc for now
      commit: ad030e5830803c308a6b035b8ba1f63d42d5dc2c

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

