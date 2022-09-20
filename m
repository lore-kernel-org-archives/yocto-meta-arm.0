Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64A3BC54EE9
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 22:37:07 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web08.3668.1663713419639722281
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 20 Sep 2022 15:36:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=i8gvVrdt;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.178,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f178.google.com with SMTP id ay9so2953584qtb.0
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 20 Sep 2022 15:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=Ds6DhilozGrt7rQlM5YhtJcpxTSdPqKnY6sblpetgFs=;
        b=i8gvVrdtioe4+yDGj5U3BJFA8u3I++wp1zZWwqvTNu06+nJ2pNa/k66H+EARTYAoO5
         MWvg5tmm0ZwO9R0OGVvwfExWr7Vulb62Z/pM1ZAoafwYkgJBUMh+lKwzfUydE8lO6kTA
         09NaNCLVMMDc74f1nPNQ06MH1Z7o6UTOij17w0DYQKRCKWHpCtsLac/u0zKK0S/6wuvK
         RYEcmbmFvZ9FovHhEk+geJmUPIx4wATAhg4vuholAS495za9WDurhYqAWFEExKbSCLWe
         qNNJjImPkjaOBjJzgz2mjEcAEzCadiMOOpsl3k3gAgCwlpiA/X6tiwrDiaKpoEIpPXia
         Cu4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Ds6DhilozGrt7rQlM5YhtJcpxTSdPqKnY6sblpetgFs=;
        b=l8ShZNfJG9qyaqAFXLcY5n59ICwSrA5p0s3wh0Oa+YsLIrdQ3sWw6AjpNupvWfBacx
         iCNCFmP05iQE4JZ0S52TOCKO9zo4Qw95NoXSrQ0cFeBWDFPZfGR8HVAC+oCN+27rZHF8
         OaAj+00anLtCYFBL+T+6vPGk9HmawUGIWe7tJ6/3S+UY668pxaxv3OJuBS8es7NCOXyk
         QU21SLdlcayxCOlV3OzyxhXvrnRs6mq0lcgYv5EPfWjgvA2aJ+L5e9SLxCBk/mNWiZBV
         mUHED8BOe+xFKlAFenTpU0zTHhFUfsEqT39j+VAVZOi1FGqfwtfvixsTEwWmy1QI8Qro
         4CGQ==
X-Gm-Message-State: ACrzQf3K5eJTQSuOkc4n95dWw2uSOBOhz1JB5zDkv7cit8PVnU25jWO/
	O/ileFnMykZqfzPScEONCu26odwdp5CRKZN1
X-Google-Smtp-Source: 
 AMsMyM7w2hgpna0YBJx2xhRMTe+xnCDYNd0b7v8SsemsDlKSIRyPkaP4I0rS5Q7aFCRfKqp1qYwOLQ==
X-Received: by 2002:ac8:5a51:0:b0:35c:fa98:1101 with SMTP id
 o17-20020ac85a51000000b0035cfa981101mr3925058qta.604.1663713418346;
        Tue, 20 Sep 2022 15:36:58 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 o1-20020a05622a008100b003431446588fsm573229qtw.5.2022.09.20.15.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 15:36:57 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon.Mason@arm.com,
	"emekcan.aras@arm.com" <emekcan.aras@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH 0/2] Add external system driver
Date: Tue, 20 Sep 2022 18:36:46 -0400
Message-Id: <166371340602.2604237.12101162723491158396.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220913125711.26811-1-emekcan.aras@arm.com>
References: <20220913125711.26811-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 20 Sep 2022 22:37:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3795

On Tue, 13 Sep 2022 13:57:09 +0100, emekcan.aras@arm.com wrote:
> Corstone1000 needs a kernel driver to control the
> external system (turn on/off, reset). This commit
> adds the external system driver binding
> to the u-boot device tree and enables communication
> with external system for corstone1000.
> 
> Emekcan (2):
>   arm-bsp/u-boot: Add external system driver to u-boot device tree
>   arm-bsp/kernel: Add external device driver
> 
> [...]

Applied, thanks!

[1/2] arm-bsp/u-boot: Add external system driver to u-boot device tree
      commit: 1182b0d2ea746327b70197c6de53b6c86c793930
[2/2] arm-bsp/kernel: Add external device driver
      commit: b086301d4621926cb8762c04b68ddffb295a7063

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

