Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0D35EEAA4C
	for <webhook@archiver.kernel.org>; Thu, 14 Sep 2023 14:35:20 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web11.13995.1694702117355811427
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 14 Sep 2023 07:35:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=BYag8lVo;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.180, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-414b0bdea1cso6020711cf.1
        for <meta-arm@lists.yoctoproject.org>; Thu, 14 Sep 2023 07:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1694702116; x=1695306916; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lZyBJ+wyCRRpEDl192ApRGpJm59oLJgPDDp2Wl03W7Q=;
        b=BYag8lVoKo91N/oKa8IFqPIwMZ0sELPs9rRwC9HAnNC2MsDYZ30Cfln5DwlfbohmrR
         +4C1yzNvj0eBlLunvMVrm6EaYnxjAtzPzSiOt1MuS8bwnKRleUggCKS1N74zKT/QxPy8
         gLzP8JLs22ucQ0SjzbttjIp+/0OI2kuGUpIGd+4p4DcTB9Lgu+Z44oMOl+L4Tgpr4ovX
         G5dTZqQrjqTffo3+9P5khMZU/kYOVWT8ZDumGPaiJ86E2JcZAYDx54pE/cbOTj050D1e
         US42hRNnfewhPixPIjHvxgTyxWtTeF+X6c1UI8tQIntuojNSUMNGUcK+C+BthmS2AV5/
         1okA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694702116; x=1695306916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lZyBJ+wyCRRpEDl192ApRGpJm59oLJgPDDp2Wl03W7Q=;
        b=XBNym8jIpyGOjKs1ZjmNWS9N7ODUEMFIdT2EBTEpEF+eTHqGAfkNyUbYSMQ3MPdccz
         slNZrMnoGqrT9ScvB/VjKxNnAeANM3WbLVzPcWRT/26pQOa8BmOdtTPKNRUU+8zhI8uY
         Jp0Yho1U5qRuBnmYtrC5ILhkmDFPKTyrtE53WnfD4n8QuJjplRiaPgq8/h3EdQAbqayV
         zocyZct8cQFrbqKlwiye3I9hw45ySXTG29PDLS5cQjpskUCh99L4eTWFnA+noAquIU5m
         D1Uojizgs/nguIzp5BtHkfeGJ8M1Y2dmORaTusExV/WbjCJYoroZy+LQuCIVLPEcqZux
         Kaqg==
X-Gm-Message-State: AOJu0Yy73VW2N92jcs6xEP98Gmy5wL1kxqqwj+M8jiUi/PLiOZ1o3hLb
	CYBFxLN9Z655K6IeglAubGBDumoiRHjH8n7wRRY=
X-Google-Smtp-Source: AGHT+IGNVDJbpGTU1cHRVw5/391WvnzOi71Eje8y+rC+RF2b8YMEU1NWXs5b1uWHrxzBGDnzr+ILtA==
X-Received: by 2002:a05:622a:1b89:b0:413:825:8f33 with SMTP id bp9-20020a05622a1b8900b0041308258f33mr5982126qtb.9.1694702115864;
        Thu, 14 Sep 2023 07:35:15 -0700 (PDT)
Received: from localhost ([2605:a601:a697:5800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id cr8-20020a05622a428800b00403f1a7be90sm485237qtb.88.2023.09.14.07.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 07:35:15 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	mariam.elshakfy@arm.com
Subject: Re: [PATCH 0/2] arm-bsp/optee-os: N1SDP upgrade optee to 3.22
Date: Thu, 14 Sep 2023 10:30:52 -0400
Message-Id: <169470185468.2756453.9959107973268607420.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230912073459.4681-1-mariam.elshakfy@arm.com>
References: <20230912073459.4681-1-mariam.elshakfy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 14 Sep 2023 14:35:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5047


On Tue, 12 Sep 2023 08:34:57 +0100, mariam.elshakfy@arm.com wrote:
> From: Mariam Elshakfy <mariam.elshakfy@arm.com>
> 
> These patches update optee-os and related
> components (optee-os-tadevkit, optee-os)
> to 3.22 for N1SDP platform.
> 
> Mariam Elshakfy (2):
>   arm-bsp/optee-os: N1SDP upgrade optee-os to 3.22
>   arm-bsp/optee-os: N1SDP upgrade tadevkit and optee-test to 3.22
> 
> [...]

Applied, thanks!

[1/2] arm-bsp/optee-os: N1SDP upgrade optee-os to 3.22
      commit: e828f3633fe3d6406e775b11e52ea96568ca2b8f
[2/2] arm-bsp/optee-os: N1SDP upgrade tadevkit and optee-test to 3.22
      commit: 18da91ffd266ed32c7de30925c55bfc6bab1ed96

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

