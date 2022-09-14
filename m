Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96608C6FA8D
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 14:09:54 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web09.6734.1663164587541740026
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 14 Sep 2022 07:09:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=38OEQb0n;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.42,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f42.google.com with SMTP id j8so876732qvt.13
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 14 Sep 2022 07:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=Ds6DhilozGrt7rQlM5YhtJcpxTSdPqKnY6sblpetgFs=;
        b=38OEQb0nawv7yHeKWLKlcvuoT9cfd1lPHKNAydBJY5nbGLJyB/D01EdfoNgrGZgGBK
         dyZoAdE2yNTmZUr4pTViPPafVNy4QvXIynPBPwuUSknhzvlswDXWQngcrSj34+dHzfnA
         Of/B4+WnyCn0X2fTM0h/Uee3UQWnMSqb/JG1Kjv3haplWRfk7Y6ePd9XNXbjE8xuz276
         k45oetf6judzMsWbSFUxn1pi4wSqMqV8f5MSPdL3ULRbe6IoD7/xhhbIjgV5XzaPMXIC
         kaih6r5ncWMvzXP7q38S2oqiv9z0FWCPbNAaG7OS0gfLT/qn74T40Kt8zqChwloO9JTh
         1kNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Ds6DhilozGrt7rQlM5YhtJcpxTSdPqKnY6sblpetgFs=;
        b=fDTLX3KjT2jeZSPAX8HFl8YGwR+SvZ64tCzXepuJjk8HqQAsFzHIs9T+7qy1UH1xep
         6CqoaWPakNH0jLKriqdB1SDrDWE41zEtXuNR4qp9FqE1CT08zalZdk1FBJl1a9of2bsg
         L5Wj48JBCtOkvXqhNKaVle74moeUmyOM4LsS7stDFwoau4FJ5PhA2sOgbuqiTgyj4WtV
         x8TXB7PM40VFz3QcSR0gEisyf6EatG38KEfz0ikpjeeH5vLT6SHiO9pfv9r0nyDmGDBa
         EulGFXgyHGFCusPiduWVB6FsM+hUSQkxVKINKgjInyqpvZtwubLxuKPXvKkB8LlYTWHN
         efJw==
X-Gm-Message-State: ACgBeo1spXOjvaxZbj5SjzaahreMETY8fmXx+aW3HMeiA2ezA9cN0DUJ
	b/Klld0qfg9CfrzWK13WR6HMBV9Z7WFfSg==
X-Google-Smtp-Source: 
 AA6agR7Ony2qPYkWo+72WFH5ZLfEzgiEnAUcxOb7LlTnRJCRtl00WPv3W4cdHM8HbXsf3W/JXtfNxw==
X-Received: by 2002:a05:6214:5e89:b0:4ac:7963:d15a with SMTP id
 mm9-20020a0562145e8900b004ac7963d15amr27693749qvb.72.1663164586238;
        Wed, 14 Sep 2022 07:09:46 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 s20-20020a05620a29d400b006ce7bb8518bsm2140779qkp.5.2022.09.14.07.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 07:09:45 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon.Mason@arm.com,
	"emekcan.aras@arm.com" <emekcan.aras@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH 0/2] Add external system driver
Date: Wed, 14 Sep 2022 10:09:28 -0400
Message-Id: <166316457281.1963578.7656070332270353162.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220913125711.26811-1-emekcan.aras@arm.com>
References: <20220913125711.26811-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 14 Sep 2022 14:09:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3779

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

