Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7828AC761AF
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 02:44:45 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web10.45852.1680230677228131578
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 30 Mar 2023 19:44:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=oG2w3Qw0;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.44, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f44.google.com with SMTP id t13so15605407qvn.2
        for <meta-arm@lists.yoctoproject.org>; Thu, 30 Mar 2023 19:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112; t=1680230676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H6VSRqze+MNAoJrizm6OHJSvYY7BjpZJ5Cwxk9sH9eo=;
        b=oG2w3Qw0KO3JGe5G1qm39RCbG3K5hnURqrQnfYj2BLKTd4P1qRYB1Zn845Z8G6sI/B
         irvfKYVheyxJDFqgbmWbpiFSTpZShp4LR1zWY/PEUZvMgbalwsmi+Wj8troL77NIj2Pi
         EJqa1hL2iBC74SsjwaSmqkmSXYb5JcRiBetChaelVAlXeznVIrv7/s3em1mQrqwX/YKV
         czH6KPXdregPaOYP0c7KBCpevcV8SRK2rj5Rcs2641lsfnaQIEYFQYT/y4DCXdXJCb3b
         QNKjJTDJ2tn8nSvqKVpTn+XI1YgpDykefa33Tu8fXfcbrit/5TlcmMuG+DwMXMEmp7vC
         JlXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680230676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H6VSRqze+MNAoJrizm6OHJSvYY7BjpZJ5Cwxk9sH9eo=;
        b=WCH4yHSWJQPnjQcYPYirjrffgk1kQhRjiK3gHhxPZlHIMoUP5p8ctkIDDXiFuv+Cu9
         TGc381kY1U+1csab2aVdJTwCz4iQdVVGeX1S7U4GUzJDcT0uvAvo6hdFbTjF6L7+OS53
         aWxN+dExjbzLgGBQkt98I38+Qn3sJnp4wG2sZjrfFsrQZBUX+y6W2JwglY5O6W1o4wJT
         sFQaDaFE8754ygEfLBOhSMSof1QlN/YIoMhzri7fX1As9j7w/r+xrYhvJTFrnGaqNsaX
         OEVlJc8xKFUr6Q2Gjf9q6XPbybzS55+du6a83nzUFtgVx+FJjsvUWigySUvnrW1HTujj
         dGBw==
X-Gm-Message-State: AAQBX9cxxJNkDi1KxtJhLxNDrShWOAr/ItwUJ/xIvuw8f81FYYo2Dg+v
	zQkpGOQxBnfIEokGIGlMmPhIe81YLKiKE9Z4HQ0=
X-Google-Smtp-Source: AKy350Ybt2lyzkmPmnJJALv8qa0Tlzf8WeWHNevM3U+ebAdQjjfS/9ttKFlYux0xARAFgFll8DRf3Q==
X-Received: by 2002:a05:6214:29e8:b0:5a3:79cd:8ef8 with SMTP id jv8-20020a05621429e800b005a379cd8ef8mr39287072qvb.32.1680230675968;
        Thu, 30 Mar 2023 19:44:35 -0700 (PDT)
Received: from localhost ([2605:a601:a600:7900:15a6:cff9:108:de91])
        by smtp.gmail.com with ESMTPSA id pr23-20020a056214141700b005dd8b9345c5sm278539qvb.93.2023.03.30.19.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 19:44:35 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Rui Miguel Silva <rui.silva@linaro.org>
Cc: Satish Kumar <satish.kumar01@arm.com>,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
	Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
Subject: Re: [PATCH] arm-bsp/corstone1000: new gpt based disk layout and fwu metadata
Date: Thu, 30 Mar 2023 19:17:15 -0400
Message-Id: <168021823621.3450077.16552582235297228307.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230329162256.818409-1-rui.silva@linaro.org>
References: <20230329162256.818409-1-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 31 Mar 2023 02:44:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4520

On Wed, 29 Mar 2023 17:22:56 +0100, Rui Miguel Silva wrote:
> Introduce the use of a gpt partition type layout, and use
> the firmware metadata as source of the current boot bank
> to boot from in the different boot stages.
> 
> This needs to be a large changeset, since it touches a lot
> of software components to guarantee that everything works
> in an atomic way, to not break the build and/or the boot flow
> of the corstone1000 platform.
> 
> [...]

Applied, thanks!

[1/1] arm-bsp/corstone1000: new gpt based disk layout and fwu metadata
      commit: 2be960d8b790afc90552c149fd00be20b7f9bd81

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

