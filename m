Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7C54EB64DA
	for <webhook@archiver.kernel.org>; Wed,  5 Jul 2023 13:47:56 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web11.17430.1688564875428655491
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 05 Jul 2023 06:47:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=akZqzF5v;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.51, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-634a3682c25so50958436d6.3
        for <meta-arm@lists.yoctoproject.org>; Wed, 05 Jul 2023 06:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1688564874; x=1691156874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IL7rXnfweLACLF/wc89IaZPG0SbLBIhW35kWvRUPbEQ=;
        b=akZqzF5v6xkuYmN0eAGpWf4gXr/FeZjEw5oe6zF/BImQ5ifFIFEJcIbetLBN9Y601y
         2YiQ9kBuCygGvRLEHvw/YekBQIPboxRegbtbJp/d2W/2BZE+cS77pL1VRrGK4v19sC2w
         IjVq296Aqu6Z70VD/I8t9OPdvwR6Px9vGNAx8zlKnj3/D3eN+638k4nKPkg1L2H1kkoo
         cnILhVSyQyM3c14J/oXPTQj+q3pqVGFqOZXYoUTRUkKuF9pSLTmkVtAHv2XQ5ajZ9gNT
         NqCEnvRAqYr5/kUFfGiUfAdHIZh66JGpX2fQEOv+CL/tg7iWKFQo1eMK1ETf/fHmCRPY
         tqvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688564874; x=1691156874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IL7rXnfweLACLF/wc89IaZPG0SbLBIhW35kWvRUPbEQ=;
        b=mIYrAtUvsG/4ujk2U9//oGwSOK/FsxKhJDi7Z8YF54ft8pH9ygZ4H9aAhlJWzW8LBh
         lqjj7j2fSqkASwuXU4iSeLoTMCNFfCTWsRgUrpvpfFPiflg/KzYFhEWJNB6kfh0512y1
         GdYVk6eRRSy3vSXxVQc08jeClKrBMGa6yMyovYGbwug8nd7oi50qg1mTI4qG7fL3cqrn
         OBBZafloF5gzsmIK3pSK5IN+BqlXU4ZxlHmaMsV5D5wSF4FqRCpl6FVovKTjLHRKskUv
         w56hMYXCbyt2G1D4TGvxT8LibDWPJw3UgT+bdt2Nxgi+YFXhymUeSaO02dMn3xMs7Kso
         2Qaw==
X-Gm-Message-State: ABy/qLYBzU172m5wHqud0x737EuRU9wa3v8+NjzXq476jQC4zQa243hX
	UAcDa+iMvlWZV8ONS1qoyGbik+uyqIWmqpnfslk=
X-Google-Smtp-Source: APBJJlE39gZXD+ULuArglSE6GfdvDyexZW4sbrFR46HtBzD6S/fHeyi8APwMx5XxVdkHPsvZhkKjgw==
X-Received: by 2002:a05:6214:2aa3:b0:631:eb39:b7a6 with SMTP id js3-20020a0562142aa300b00631eb39b7a6mr18718448qvb.33.1688564874090;
        Wed, 05 Jul 2023 06:47:54 -0700 (PDT)
Received: from localhost ([2605:a601:a600:7900:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id h1-20020a0cf401000000b0063007ccaf42sm4650772qvl.57.2023.07.05.06.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 06:47:53 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	"ross.burton@arm.com" <ross.burton@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH 1/3] CI: use Kas 3.3
Date: Wed,  5 Jul 2023 09:46:44 -0400
Message-Id: <168856480464.237083.13001949425787749274.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230704091857.3645929-1-ross.burton@arm.com>
References: <20230704091857.3645929-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 05 Jul 2023 13:47:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4855

On Tue, 4 Jul 2023 10:18:55 +0100, ross.burton@arm.com wrote:
> Kas 3.3 has the following new features:
> 
> - kas: Introduce commit and branch as alternative to refspec key
> - kas: Warn if a repo uses legacy refspec
> - kas: add support for lock files via dump plugin
> - kas: track root repo dir config files of menu plugin
> - kas: add support for --log-level argument
> - kas: add GIT_CREDENTIAL_USEHTTPPATH environment variable
> - kas: improve error reporting
> - kas: drop support for Python 3.5
> - kas-container: fix invocations with --isar for some layers
> - kas-container: Purge tmp* on clean
> - kas-container: enable colored logging
> 
> [...]

Applied, thanks!

[1/3] CI: use Kas 3.3
      commit: 95e7e59c1a81d338d7eb710aabdf5c38cdddc45c
[2/3] CI: update to Kas format 14
      commit: 77b5e1c72c8d22a9c60eff26eb9bcad8edbc9e47
[3/3] CI: use branch, not refspec
      commit: c2d0905b51ff267839d1482640d913ccfa3bae63

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

