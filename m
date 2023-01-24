Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F8F5C25B50
	for <webhook@archiver.kernel.org>; Tue, 24 Jan 2023 02:10:26 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web11.5695.1674526224652954151
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 23 Jan 2023 18:10:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=DgkWDqIo;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.175, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f175.google.com with SMTP id g16so9974652qtu.2
        for <meta-arm@lists.yoctoproject.org>; Mon, 23 Jan 2023 18:10:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nOd61J5+eDZ39G6DZNL+Y8VayIDZXw/Tv/zTIzMu2/U=;
        b=DgkWDqIoWSLt8LJx6nTE6Ixck3H8yv2Slaz5OgAfnLIwSMnE6UCPYvIOGUpMHsSA6W
         SfT/nwHfFiJaxh8VuRJcB0SfhHDhnCj8DtU3gbXRNrr2oaUQHyxp0UUnjhobeAc1pQC7
         8wLwDN3YOmEaGtt8LpC7O7tK7DYEI0XcDYKDjnZ+GkESoOcu0pPXO+wkojc70A4uRprb
         cZ+sNysc0CfpQlpXmTqdbI1MnzNmXn1AWFD1IphNHQvb0feeqg+QBtlfjUyrZpgHRjDp
         W4iTuYZ1HFp1G9pTEmPcsWlttoY8dUoI5jfQl7lt6UhEda6JuUzyKkTOcPgP/3BCDV8v
         TbCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nOd61J5+eDZ39G6DZNL+Y8VayIDZXw/Tv/zTIzMu2/U=;
        b=vHZafIjS4ifHVlnPKaoF2uCLd0WLL5djsYCaSdR0bSfiqqAbZZ5pSxNGoFga4J/lRK
         Xu+BOx2I1UizKDVXr/3sIPFgfpwMN+ZjusnJLbBDYHy+YhqA9bvbAYJc3WiPFBSjMt/u
         Lc3iBqqov4GPzX8QeWytOI6O/TEOZdCKseBu6vlVPX/YmhFPXS8TNiox5i50+gZoI9br
         VjUZsNOCwUPkc4MAkq8hLleoZNNaVvudzXxol3BoMo8/tSEHZUzb8hZ3Wy1Mro0OQChk
         TtY/uBW173vdLS35GkddR4yZgeR0IYzRzTGj9cWcIVMINLyBBPRgX+83VxJJ8XwHplRH
         fi8g==
X-Gm-Message-State: AFqh2kqyclhh1VmX4fPv7/vygBGWdFUjQhKuCO+C8cV3lDe4tc8PtHEc
	CGg1Nda7A4S9IyXx0L7CUXEQl6KzPTfOHfVg
X-Google-Smtp-Source: AMrXdXs2hWMeS2FeNtEThbxrB+x9jSW/6sXxcOlEl7j9k8h1yoGAi+ucxu6CGVCfKNr49nYbcZ4TJQ==
X-Received: by 2002:a05:622a:178d:b0:3b6:35cb:b946 with SMTP id s13-20020a05622a178d00b003b635cbb946mr51016530qtk.14.1674526223331;
        Mon, 23 Jan 2023 18:10:23 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000::59])
        by smtp.gmail.com with ESMTPSA id e1-20020ac84141000000b003b63c08a888sm437537qtm.4.2023.01.23.18.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 18:10:22 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Peter Hoyes <peter.hoyes@arm.com>
Cc: Peter Hoyes <Peter.Hoyes@arm.com>
Subject: Re: [PATCH 1/4][langdale] arm/lib: Add XAUTHORITY to runfvp environment
Date: Mon, 23 Jan 2023 21:10:19 -0500
Message-Id: <167452621939.161137.4825031105997179424.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230123135239.3793628-1-peter.hoyes@arm.com>
References: <20230123135239.3793628-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 24 Jan 2023 02:10:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4319

On Mon, 23 Jan 2023 13:52:36 +0000, Peter Hoyes wrote:
> aa89fe3f ensured environment variables necessary for GUI applications
> are passed through to the model despite runfvp env var restrictions. Add
> XAUTHORITY to this list. This is useful when doing X-forwarding with
> Kas, which creates its own home directory.

Applied, thanks!

[1/4] arm/lib: Add XAUTHORITY to runfvp environment
      commit: 65c36dc6c38e10bc51f485f8d5db991bba50fab2
[2/4] classes: Define FVP_ENV_PASSTHROUGH variable dependencies
      commit: 9d980336fd7facb5003143b6053d141007668565
[3/4] classes: Prevent passing None to the runfvp environment
      commit: 7090a9bb8ebfe5b9b06276e495594e72bc88dfbb
[4/4] classes: Set ARMLMD_LICENSE_FILE in the runfvp environment
      commit: a590d6e1b88638f570ba5af7811c3b27f73e7cc2

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

