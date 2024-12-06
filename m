Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A8A6E77173
	for <webhook@archiver.kernel.org>; Fri,  6 Dec 2024 15:44:22 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web11.39891.1733499854376630546
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 06 Dec 2024 07:44:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=vic1zH7t;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.181, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4668983b04eso15950021cf.1
        for <meta-arm@lists.yoctoproject.org>; Fri, 06 Dec 2024 07:44:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1733499853; x=1734104653; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QEVuvV1ov6Z9+ImOyUC0O3r/F3/RiwNcdz9V7x46w9E=;
        b=vic1zH7tiaL74VyH8j0EM2ga3CmNyRLWXH0ZqFU4s0d7NQYzKHXBXmPdUdC60OVwnC
         TKrZrHuOH4Y8KpJXODtcL464/m4JO8wzajt4GJ4eF15MwRSxAWBnIUpVSCwIPu15HY3c
         fdC8qbpFX5uGmpEzin9Ujo4j//vb3iNyTD9psey8vNkB3kw2o+piiF6Io2bIk8OIPKTC
         H+7vc/86h4/xtI8fAo4rF4H2TuclZWNSjfSxN50lK+N0USiXSivozGM+Q4kZLveVT4bV
         1dPYxu2zaLRpgoEKQuWauwwWiLzaSRfbFBk6Fh9y85veBCY6YH1u6o3rDP2aLASqsJ8F
         M/Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733499853; x=1734104653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QEVuvV1ov6Z9+ImOyUC0O3r/F3/RiwNcdz9V7x46w9E=;
        b=D6sk5lGMK0KjrJKkmjARCiJAEXfiukvyTPxuqBYXgI0kKPxZYhMyvzC1TVzREJ6kKM
         qou9sVwi9B74VAr2Kvm/yPWutEF7J0fFBz2PzaBJBTLG0gLgPLwky9aes10TZ2ng77Wa
         cbq2H6tZmy+TYP6MfuByajLhi6MkA0bcEmFCDuHZ+ZZ7VELi4ArqVPE2PE5a3RIVou+M
         YZdqlRU3L3sCG3Jp/SzOe69aWVVk8JWnC87yjgiE55oer6xs/056RDAPPsBdozpb9CNg
         iNJJJTL4b0VmYHrSp6MUzDdOJCcdksH8lCFKdDjHmWlT0TjnbzG16OPzTmB+xeMBRZgv
         r82A==
X-Gm-Message-State: AOJu0YxC5R2iBo7hUGjMLiKzm7yl7KjufNVPVOeQaaiFAbZB23wORcM6
	Niiy7pg+TmOlxN5UgJhoq7Y+G0I/RhhwONBMjNttsipRXvLhAhncIjF+AW3wFk6GNRTiSriwwlI
	=
X-Gm-Gg: ASbGncv+2AJrrrD7DYtcpiPkzilhs8TvdX0bWRJmPSm/cKWaR+4sw5JMrTqwMTZCAqu
	yeq6ae5wAXZED8yTeUbp2qn3aCCQWxGoAueJuZAGxB18vFqj7FT/X72vsjsqXPsUMFkRjABaAXJ
	YpiS5gbA7gkh6fVJhFpKL3HpNvd89dBY9C48TzAHRdbR6zo7Q0olnJmu74wWbvdm99seZJXrHfP
	YgVBxnwLq7cdTKSc4OftEe7BvYjQvlOOH0zbuIciw==
X-Google-Smtp-Source: AGHT+IH9tgDzywb53OVXdfpzIATuGZRM/lqHw4xxXzQoooHIPmy/LkXuUSCZTOFyTiMW6taR7EvNWg==
X-Received: by 2002:a05:622a:1984:b0:45d:7ebd:76e0 with SMTP id d75a77b69052e-46734efa68amr47084241cf.44.1733499853112;
        Fri, 06 Dec 2024 07:44:13 -0800 (PST)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46729793741sm22000921cf.61.2024.12.06.07.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 07:44:12 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
Subject: Re: [PATCH v3 0/2] arm-bsp: corstone1000: `CORSTONE1000-2024.11` pre-release
Date: Fri,  6 Dec 2024 10:35:42 -0500
Message-Id: <173349934368.2735333.241915314512638101.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241205113343.482997-1-hugues.kambampiana@arm.com>
References: <20241205113343.482997-1-hugues.kambampiana@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 06 Dec 2024 15:44:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6279


On Thu, 05 Dec 2024 11:33:41 +0000, Hugues KAMBA MPIANA wrote:
> This patchset contains commits related to the `CORSTONE1000-2024.11`
> pre-release.
> 
> Remaining steps for the release:
> - [ ] Merge the commits to meta-arm `master` branch.
> - [ ] Backport the commits to `styhead` branch of meta-arm.
> - [ ] On `styhead` branch, add a commit to uncomment pinned dependency
>   layers SHAs and change branch to `styhead` in
>   `kas/corstone1000-base.yml`.
> - [ ] Create `CORSTONE1000-2024.11` tag in meta-arm on `styhead` branch
>   after above.
> 
> [...]

Applied, thanks!

[1/2] arm-bsp/documentation: corstone1000: Amend documentation for CORSTONE1000-2024.11 release
      commit: 5c40c5f7f740a59b669c74da898a3687d53e2d6e
[2/2] kas: corstone-1000: Update the SHA of the Yocto layer dependencies for the CORSTONE1000-2024.11 release.
      commit: 8af2f218d45387851fe870dada856a85d5b98438

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

