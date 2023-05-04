Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98B45C77B7C
	for <webhook@archiver.kernel.org>; Thu,  4 May 2023 19:28:29 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web11.4196.1683228504905512838
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 04 May 2023 12:28:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=b6DHP8n0;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.173, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-3ef5b5d322dso8085381cf.2
        for <meta-arm@lists.yoctoproject.org>; Thu, 04 May 2023 12:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1683228503; x=1685820503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tzrj3LJYSEFiChO6lKFa0iWsQT35kN0ztFsz0MQCTcg=;
        b=b6DHP8n0TDDoLpinrExV8sIfAXc1EfINTY1YKnIWqVUieG7I+mJ/7bv7BDH/0B9hlw
         x2FR28O1u6T9bavPOk227w24Dzf2Mv4OK1Pt/AqRJLmRybKiGek5hlCnqdWggvwJ/S3g
         CmCgzXTXVAAdG3eCnk7qxjD4nBJUt8WEptkoxPf0JpGsHvEgUKe3BYG73C+1CHKQI0s/
         jTMbPgVlab89YEbP0pqQU9RvsBajxrWxkwXzSlPMCwTb4yEODbUg9ZJGij4IStxwJNCe
         +ZU20eKMdM7CG04AcA+/ioMCtlxsYWG0wWljOr90onXB/EBpppAd1nh7sfVvxzymieP7
         SyxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683228503; x=1685820503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tzrj3LJYSEFiChO6lKFa0iWsQT35kN0ztFsz0MQCTcg=;
        b=j+OqGyfovKG75nVLGd0slDmroc1nMm2Z9bQ2dWBPBcIHHS/ZC6R67bAXvgtHstR7YM
         w8Iy9TRBE4930jDQWnCwrijFaDnK956OxpugHgntzuFrkuwhQKBJR6PSXWXcR7kvuIC0
         xwgNKmiM3KyQMBnS5zdZnp4RmUSyCT7LuAIPaqJhIUBOJy1GT266h9vS757KXdlXsWKF
         Rb8RnR4rWWEbfgWVwNvDI0E+lfRZFf9wF18Zb0siFZWB9+9Adn41vN/LfoSwZ4bTPI43
         IGip47FlLrC9lNUnsn+tVTKe1FsOJ/18C1LMDH1cmI0aZCUmU9Da2Fu1cz5/j45g7mNn
         BefA==
X-Gm-Message-State: AC+VfDz3feFQsCvAsmzqkFPSBFwIDSDd1APg18sE/XfM+u9KsLi7y7lI
	9k7n2fucqF7sAbf2b6+E2VRhYVnG0ftFrAtM6H0=
X-Google-Smtp-Source: ACHHUZ6UuLT+lgcNlrwd/T/KNREnuL6g28EOAMjU2HBlQKvdOlD2tXMSDD+SAg8r+Csx9uLkNU28fw==
X-Received: by 2002:a05:622a:489:b0:3b8:6ca4:bb23 with SMTP id p9-20020a05622a048900b003b86ca4bb23mr7207852qtx.15.1683228503548;
        Thu, 04 May 2023 12:28:23 -0700 (PDT)
Received: from localhost ([2605:a601:a600:7900:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id f15-20020ac8470f000000b003ef33e02eb9sm12704993qtp.83.2023.05.04.12.28.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 12:28:22 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Rui Miguel Silva <rui.silva@linaro.org>,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH] arm-bsp/u-boot: corstone1000: remove debug messages and fix env
Date: Thu,  4 May 2023 15:27:59 -0400
Message-Id: <168322847970.195972.12523620881949792507.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230503144713.3294012-1-rui.silva@linaro.org>
References: <20230503144713.3294012-1-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 04 May 2023 19:28:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4632

On Wed, 3 May 2023 15:47:13 +0100, Rui Miguel Silva wrote:
> Remove log messages, that would never show up, but clean that
> mess. And fix the env script and config so that trigger the
> load of kernel from reading the gpt.

Applied, thanks!

[1/1] arm-bsp/u-boot: corstone1000: remove debug messages and fix env
      commit: 0b5724266a8e559cac1724350c1ff2f9e6580326

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

