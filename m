Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37911C433EF
	for <webhook@archiver.kernel.org>; Mon, 11 Jul 2022 15:06:11 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web10.29788.1657551961400556449
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 11 Jul 2022 08:06:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=Vvms63OO;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.173,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f173.google.com with SMTP id o26so4020853qkl.6
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 11 Jul 2022 08:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OoLe3FaLkfF0GTBGsS8IFpghzwlEFNnmmoMJp22vFuM=;
        b=Vvms63OOJ7Sklmu33ZyDP+xpILtEpBkILrSuLzTOgq9cR2/DjCL537dGz0WQFKHuP3
         Oo/OHcrS72LaLuZadeQK1TzYF/5myMlJU2RqRMaFcNEFj9tiHdYOa/l8sfpaw/DgENY5
         D3KGwu5N4r6usKjP6a1UF4ApsYCUbdUk/eg7KvrY1RCkdwybzUpMmKPrqHFG/to1vYBK
         RxD1GoXIokd1SMpbpfS6NJzbWdfm0012PY9xAfmYxWirRubxoZNEribPqkYpU3F5L6V1
         aXrKGdcvnBHKT2fpk2TfpjIbwRtWPAMRujG9Ae4J4MRqelJq9q5WorGtFsiNkjnz1TFh
         SVog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OoLe3FaLkfF0GTBGsS8IFpghzwlEFNnmmoMJp22vFuM=;
        b=wH+JCppwVg6BXks8aTYIao0EQz8IZCnaYC+9HBasV2ajlsP/iFCa4caYNanHTXQvSR
         dd+QTFllNZnVytpkELDKvUWEKLQeukFZZE2jV45iB+dUx4yj/W5g127t871omwYEfSX0
         DCOj3Z5gAkUgNO2tGL9JJm07XN78TxgkUJxpL7PpO3h4Y44dMKyz9Zf6nlaE+v/4wfgR
         Tp9eDmVyzs28387l7jSRUjy8yioc7mGu1LfBniOnaJNPeZ77AatHDKu0chBw732GoZOA
         ISFdAw1amvHo2EpOKukn1HbGpsB7+rO7LnFcyYB15nmvo/lGGi3gnwL9bYBoZWYrxVme
         UEMw==
X-Gm-Message-State: AJIora/91f5s4wY9evmGzvHJ/qGWQ2JiBDgF1bd9l6vI9zLh92nn6eCO
	3Y/oT1CNsSKu18I43rBatkNOFCFfu/TlYg==
X-Google-Smtp-Source: 
 AGRyM1v8CaR7c4MVQntHQs1tqsr3vvQLqPG/XrIEvKUhsUvNQIpfnuB3Gipt5j1hJMfvR/j7QTfDvg==
X-Received: by 2002:a05:620a:19a7:b0:6b5:8f10:8025 with SMTP id
 bm39-20020a05620a19a700b006b58f108025mr2077892qkb.376.1657551959944;
        Mon, 11 Jul 2022 08:05:59 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 s8-20020a05620a29c800b006a67eb4610fsm7082822qkp.116.2022.07.11.08.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 08:05:59 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH] runfvp: ignore setpgid errors when spawned
Date: Mon, 11 Jul 2022 11:05:36 -0400
Message-Id: <165755193545.3277428.17000553099204954967.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220707084905.1914073-1-ross.burton@arm.com>
References: <20220707084905.1914073-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 11 Jul 2022 15:06:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3552

On Thu, 7 Jul 2022 09:49:05 +0100, Ross Burton wrote:
> When runfvp is spawned from an other process (for example except), it is
> throwing a permission error.
> To solve the problem, surround the call to setpgid with a try/except and
> ignore the permission errors.

Applied, thanks!

[1/1] runfvp: ignore setpgid errors when spawned
      commit: a25192f51dac9401f617df0376334f5d65d967cf

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

