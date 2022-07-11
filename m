Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1D9CC43334
	for <webhook@archiver.kernel.org>; Tue, 12 Jul 2022 13:02:09 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web12.8801.1657630923847438427
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 12 Jul 2022 06:02:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=j8sBTulg;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.172,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f172.google.com with SMTP id o26so6135463qkl.6
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 12 Jul 2022 06:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QFYFYUQSrF/Gzm0n0PgXuZU9hv7Q82Tcq6ufgeJzPfQ=;
        b=j8sBTulgb4OIxZupOYPzVkSxZUdGkr+bTocFPdJw3Fe7Iv+LO6/0L3HvYpisfyJ33y
         j6iFqnOu/4/osALRKkH1k/canPZ+er43kyvCCwt/mmQfCyb0fYQ8N8lbgvqLp7mbEVFY
         fW0leMfdvTeJqzG9ifClSbUDkLigx2SghwWi8Gw/6bu7lrulRK9ILZ8JCq3bmoxjbc0Q
         PJrxbDI0mrxCetqrey75L02yK3mfO/cpQjtr4rXBJ3AQq8Tp/0UvNNacVAgzRHFmQQnJ
         BUqRAgFJgyUEE69gzNBIGzinmnZqvewVzo0B6u9KB7XVDLQbeOJXOLH4IgclgGnLmr+m
         Qx1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QFYFYUQSrF/Gzm0n0PgXuZU9hv7Q82Tcq6ufgeJzPfQ=;
        b=Coo2fB6xPDPPQ09OqyxOHrOfyNdkS+QP1gnZHp08t2qAhr8L9iJYrLUt84gJR9Jv9m
         pKzsIyr3QCkpn3m0o59/DCnr1Vma/9pgC88S6OQlnv1Z4sALDvqhcPWSBhZUa4HTTNH6
         CLkXcsmipeNTPywqImUvFGjnPEJ2CGbG2Qgsx9lAzyQGKsUDWOcmUxhKiAJxUAzCbaHq
         XnZqxTs/EVj+wV4t3VyT591eEE9VxQ8dGrmnjpocW2PwODCujOP8aRVBQdwT0KLpx5bC
         3/nUrpkqperpZ+2iTkNxjQl8nzRUZDDWrmQM2AsGskf2Q5Xpjs3lB3UZDe75S7riSTEr
         q1mQ==
X-Gm-Message-State: AJIora80RfOvcULYqqLhMCwoozV9w/SXfeBRsFxmcQXmJLDb2fz3uH6W
	VLjaiRioTN5J8SMYGoDhzbiXwE5iJClm8Q==
X-Google-Smtp-Source: 
 AGRyM1sqkHpQEYjXDt2hr6Jyv1VXtF45Gf2jwjhyK4G4C0gR17hXMqRcfrKm8aO8bVDxNaMTOQKQbA==
X-Received: by 2002:a37:bbc5:0:b0:6af:5d81:209 with SMTP id
 l188-20020a37bbc5000000b006af5d810209mr14867757qkf.721.1657630922284;
        Tue, 12 Jul 2022 06:02:02 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 f11-20020ac859cb000000b0031e7b06edbasm7652599qtf.67.2022.07.12.06.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 06:02:00 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH] runfvp: ignore setpgid errors when spawned
Date: Mon, 11 Jul 2022 17:32:32 -0400
Message-Id: <165757515240.1610500.10523841635752886596.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220707084905.1914073-1-ross.burton@arm.com>
References: <20220707084905.1914073-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 12 Jul 2022 13:02:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3561

On Thu, 7 Jul 2022 09:49:05 +0100, Ross Burton wrote:
> When runfvp is spawned from an other process (for example except), it is
> throwing a permission error.
> To solve the problem, surround the call to setpgid with a try/except and
> ignore the permission errors.

Applied, thanks!

[1/1] runfvp: ignore setpgid errors when spawned
      commit: 528d28f7f14c3c2045e3f628ae018587bc9141c1

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

