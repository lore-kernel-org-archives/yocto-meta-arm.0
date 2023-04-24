Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 343EFC77B61
	for <webhook@archiver.kernel.org>; Mon, 24 Apr 2023 21:19:44 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web10.64662.1682371178964347048
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 24 Apr 2023 14:19:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=3N+IH/ah;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.176, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-74e17099772so445948385a.1
        for <meta-arm@lists.yoctoproject.org>; Mon, 24 Apr 2023 14:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1682371177; x=1684963177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HE1Hiti+iNdr54Ulq1MeF9st5YvSlSX5GlJA5opJ5U4=;
        b=3N+IH/ahmtlZsNVJovbBjw3VxMmhIzY6ne7XS2Gc1a3c5EyML86anIhjIontn++1Mn
         IbooyOi5gMRAGkHQoeOz46Qc8XXemb6zjlaul72KmbMhwyWZPF0tlYs9ZhV+v87/+zON
         AwwbCpzy4lx95r0SwugeBqqDhyMUiLOY0p+9wRVWfgerHNZUG9ez0PdwBKdYsfiZD1r7
         dFcJUvZb0NnY3aWaMCcQtWxP1veygH1/ncp41wdGo+FpcY/8n/DngDG8GtvUozvhJFcG
         I87o+x2cxeMYd3HC8V7nZdmfQYY4Mfd//d9r5ZrF7UUJjJt0QZv8zZcSo0kfnbYL6+QV
         ax7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682371177; x=1684963177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HE1Hiti+iNdr54Ulq1MeF9st5YvSlSX5GlJA5opJ5U4=;
        b=Xwu8AMt3A0CotJlaHjlfl36Wo2BZu8vn7i7ywcI8ej4ZVGCrNlTOl0+VkHhMDqmZxQ
         rYupt1p6yDUVXveyUFe0M14muEg4pKQQgoxWLe0vjbeniEZtCYyERW0hajP3UENIJaNu
         oe8w58AVW+mQWzPPk1Jq1hIk8/pa+a7i7m8M0dys+Ck0CqFpfgyvs9EJHGyto0jKorK0
         lcG8NmG4JjQfI91vBUw4sh8m9OEDZcX+VPOA/Aa7TG8bDfvh6s54c+U1Z9Cyn+iNqyBM
         v2AoBCW14dNC1vnR9TaXzhhHalHennHfiYnioAGBxqW+YKmJ0ZKGvAH5VHvIxBBLIHLP
         5v4w==
X-Gm-Message-State: AAQBX9cXHsEyTHZr5BtL6bkTBFappMaGCcgF6qreXAX46JN3+BCj86Il
	6uvA7LMvmmuoWewkbXM6vnBEIm95ujUAba4vhgM=
X-Google-Smtp-Source: AKy350aKary1ufxNg3b1VLh7HZyUnHJOnMbDNswKHKdzoNgqax1scHYu489/MdVoSgFgF/MYQowNPw==
X-Received: by 2002:a05:6214:528e:b0:5c0:51f0:eb45 with SMTP id kj14-20020a056214528e00b005c051f0eb45mr22984788qvb.15.1682371177533;
        Mon, 24 Apr 2023 14:19:37 -0700 (PDT)
Received: from localhost ([2605:a601:a600:7900:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id r197-20020a3744ce000000b0074e1625917bsm3877603qka.32.2023.04.24.14.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Apr 2023 14:19:36 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	"adam.johnston@arm.com" <adam.johnston@arm.com>,
	Ross.Burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/1] CI: Remove ts-smm-gateway from N1SDP
Date: Mon, 24 Apr 2023 17:19:22 -0400
Message-Id: <168237116540.1521195.10955991877443589141.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230423195855.1800774-1-adam.johnston@arm.com>
References: <20230423195855.1800774-1-adam.johnston@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 24 Apr 2023 21:19:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4614

On Sun, 23 Apr 2023 20:58:54 +0100, adam.johnston@arm.com wrote:
> Installing SMM Gateway SP on the N1SDP may stop the platform from booting
> for on-device testing in CI.
> 
> In n1sdp.yml, remove `ts-smm-gateway` if it has been added
> 
> Keep `ts-smm-gateway` in default SP set so it can still be tested with
> other platforms e.g. `qemu-secureboot`
> 
> [...]

Applied, thanks!

[1/1] CI: Remove ts-smm-gateway from N1SDP
      commit: b3c7b2d7a53f5781787a66f629305b9467adeddc

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

