Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C9A6EB64D9
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 14:28:04 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web10.9015.1687184883845209473
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 19 Jun 2023 07:28:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=ukuzO4Hb;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.182, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-3fde068cc3eso22251091cf.0
        for <meta-arm@lists.yoctoproject.org>; Mon, 19 Jun 2023 07:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1687184882; x=1689776882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nO/czQl+HKRK8j/UfaSk18lCTh7KXAaoyBWNtUTwPY4=;
        b=ukuzO4HbVofGhw37hyNLdxuG+lBG+elY+xdWmJE4sOmL+AMrtjporqVRJWL218EjBu
         LTp2I59RPCWUT1kHkxhTOOLzBipWHsqt63RUKwpZssY1ByEp+Pek5a4fa9SQFNDLJj7M
         X3M3wBbp62YE9Q3ggDAi+LEiO+n8vovpJ0LvhLbkET3/U5Pp7XQQ1CWlpO1ls7SGeBy4
         sUTXmfJk6Lxj2MFWghcjfMv5EJXbiIFctxt6ic9i1hLFx1pQPIIqh+JnNGZwnaofToGy
         p7gIxDesL5oQ794rH+FGGOoQoc/g5MVglH83FGwxff1GOEN47KZzUQbRwEYr8HN+STHK
         i6Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687184882; x=1689776882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nO/czQl+HKRK8j/UfaSk18lCTh7KXAaoyBWNtUTwPY4=;
        b=Hhm2rnaUTtwyRA9jy5l6SxNmFnchmH+GK3+UGSXoaOfyjRo0Z4oeg//Vw0AiFAQRCI
         mXokYgZF+FT5xQ4rf76pC1HXPAMmKQ1SHl7baRjsaCY14rZqHh56ffVn4ko4v/GTuBQG
         7B35dJOkn6trM2m74ZpzlEcsm7OI9nkdYrEFa3r9xEWFDJvJ18aYecBJUo2Y1QR01B2V
         0yZfynEv0bwvmloygf3SWerjSDtSZFdwzblJEUnT/j30CpBuHHhsKfeyqoL79hlz9xXx
         hP1oM/U92r78AIQYv3HwkWGPz30q2z4P1g+dt9+GfIlCXzw/kkE10GRJ1OL8biVltD4G
         UNKg==
X-Gm-Message-State: AC+VfDxR3PQ1I1zTML+V/h3gJLlCWqnJg1ccJJxymMQN51rDpy61UHf7
	wHLjg5/mtO2FPqWahECLMDJRwUGte32L74h5dJw=
X-Google-Smtp-Source: ACHHUZ55ohmXnIJo6F7Wb/e5WohzKRsakgQ2oLnnFwKwOFemrp/aH2pjv0DL1Skau2WfLu18ox0luQ==
X-Received: by 2002:a05:622a:1a02:b0:3f8:67d7:e989 with SMTP id f2-20020a05622a1a0200b003f867d7e989mr11005477qtb.59.1687184882589;
        Mon, 19 Jun 2023 07:28:02 -0700 (PDT)
Received: from localhost ([2605:a601:a600:7900:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id f12-20020ac8068c000000b003f38b4167e5sm10881556qth.2.2023.06.19.07.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 07:28:02 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Khem Raj <raj.khem@gmail.com>
Subject: Re: [PATCH 1/2] gn: update to latest
Date: Mon, 19 Jun 2023 10:27:47 -0400
Message-Id: <168718486975.664912.14859963620051668698.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230616181712.4168591-1-raj.khem@gmail.com>
References: <20230616181712.4168591-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 19 Jun 2023 14:28:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4804

On Fri, 16 Jun 2023 11:17:11 -0700, Khem Raj wrote:
> Brings fixes to build with gcc-13

Applied, thanks!

[1/2] gn: update to latest
      commit: 856610082bb188deb81a9e685d251fcc37b2f644
[2/2] gn: Fix build with gcc13
      commit: 770bef8dced4c79b8fa80c4a814a65c8ad080eec

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

