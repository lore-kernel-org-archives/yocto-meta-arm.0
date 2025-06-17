Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE1BDC71157
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 14:01:51 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web11.19770.1750168903124481096
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 17 Jun 2025 07:01:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=v8El1bgE;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.180, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4a440a72584so56130321cf.2
        for <meta-arm@lists.yoctoproject.org>; Tue, 17 Jun 2025 07:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1750168902; x=1750773702; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LQ2GgQnxU3Xvsqr7pPMtjy3pwgcdR5TzD+mWIjleTD8=;
        b=v8El1bgE3T36mJ0Jf8/nZZDzSsqryHMoaZxFJRHnDGMJkaLZoVRXhgZT0VbYdls8Qu
         i0r+GP7aklxi1ho3m0lHnwaixD85zcEhSoGWeZsmrtRY9SNzAzZ+XlLv/UftWlwXfQIp
         Uedtb+GogMfgea0QxoviS1lV4Jn0fTNuhel+fUwYLf1ckphTumMxTY8nWvktsW+ZHDHv
         rJC1wF7XkRkOlbKrZbIs+RQKUcgzvRphvqDIXPxgb7NgCJysLdNS1yb7zXISyxM1KkTJ
         TBzcBuxSPSHUXeKcT6dTRRR9GNCXy9qCefQ+mFjt+XwYogLf236pPfduLGoma4Zl9JQl
         G83w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750168902; x=1750773702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LQ2GgQnxU3Xvsqr7pPMtjy3pwgcdR5TzD+mWIjleTD8=;
        b=fuxfcEYNzhdDszn1yQfmzC5UJua7pgfcxOEDnbOmSASKagi1Bd7TbDGwFLVZZUGojE
         gpppYG0GUX2ZDEykD5hqQQ0579bhKzjcQPZUjqnHtlJH7O1VN2I3G6YOlCBVzTa1x21d
         XjjACu5H3UaHHZXGWXw2uWO1KMd9E9rWxzS4AzMCWJiHPqhRXyyYEdY2dZg/FH0fvULl
         KjclHvKkKmA+O3gBeMMEaGmPqL/NmInXcxovxXzZ5edmvx5Nnqndq45lEYIVCEPfchHN
         4981WzQ4G2FWgRlLO1vCgd0sMvw8lwtXT06lDyr9LmUK1+S0VaCMJgb+ZStDZWCEAHdJ
         OZIA==
X-Gm-Message-State: AOJu0YyneIbxb9ma4bSu+oa8xTnJJpRrIgVMbIqAV1O9KGs842kDca0X
	2GqT9Ldf6/NE3sPXd/6Lqtmj4Oe6oMtcKzcDkIpJx+8sMwEi57QhXJ9J/eVfzKeLBs1lTfNqg2G
	9FiE=
X-Gm-Gg: ASbGncuxp/7n3KaROR8trEEiAj+hapeoDbQnFWn1c7qcM0fJMhrrbKw02GFVovOw5XK
	NmlC3kLw45/lZ/Jo8AfdI8P5rSOe0obpC0cajxEzdntlnoOsXQnn1vK0l6e8Yflpn7REFQLatr6
	jCCb5j69v3CknN0s/LYo1vqA4Gg0k3LX84P9tfSiY8sqvU29bS9QmBnLTVS9+jY9Bt41CJx1OAr
	U7QNSkJ7CqbYFB2qj2JSU9gIWF9E5H6COYmIJZ3SL/59ToMThOAF6eKWamfh2d5W0hj2uAEQN19
	dUi4l/DCEd/4Sg/D5moLacj/Mt7KWwt9pX51dGNyk4DCcjfLo7lStw==
X-Google-Smtp-Source: AGHT+IGwsW7FQJa5J9fwW1GtXDon0JpVWK//3VgYfj52LT5wWIT1qI7Z5JLXmTzWuL7TrOe3e1nsVQ==
X-Received: by 2002:ac8:5a43:0:b0:4a3:fcc7:c73c with SMTP id d75a77b69052e-4a73c4fd271mr198114541cf.8.1750168901673;
        Tue, 17 Jun 2025 07:01:41 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a72a51cebfsm60774661cf.76.2025.06.17.07.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 07:01:41 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] arm-systemready/ir-acs: Update URL
Date: Tue, 17 Jun 2025 10:00:48 -0400
Message-Id: <175016884823.1970111.14136225171453122312.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250616135214.29942-1-jon.mason@arm.com>
References: <20250616135214.29942-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 17 Jun 2025 14:01:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6561


On Mon, 16 Jun 2025 09:52:14 -0400, Jon Mason wrote:
> The github URL where the image was located has gone away on the master
> branch.  Update the URL to point to the legacy branch, which should stay
> around (according to the documentation).
> 
> 

Applied, thanks!

[1/1] arm-systemready/ir-acs: Update URL
      commit: acd1d70123479c789942b43bcbd6f52935c1f3cc

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

