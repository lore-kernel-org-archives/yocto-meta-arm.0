Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82BA9CDB483
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 20:03:51 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web10.262791.1697573029451469723
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 17 Oct 2023 13:03:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=FeFQ8Vg7;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.208.175, mailfrom: jdmason@kudzu.us)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2c51388ccebso46202771fa.3
        for <meta-arm@lists.yoctoproject.org>; Tue, 17 Oct 2023 13:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1697573027; x=1698177827; darn=lists.yoctoproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fSBA8Y5ldSBVAvzRxZ7Li+DNoyIbCk7Nk2AUhnicxhA=;
        b=FeFQ8Vg7Hq3644Y7Xs508induDxdgtR2EjngHcUr4v5VlYI0RXn2ZNAcrWhUkmW74q
         /8z0NDjU2SiMgM8EN/OEkd4kFXgms7HyntdLL+viOTuKf6MhmLDG8BtqLbkiHrN1Ex04
         XNimAMndt+HT6zSqamTK2Jm1h0KQlr1g75GKWH07kiC5HHfpGvPfXjq4c+ZcBZE0ZLUP
         bgbEtyApGW1hgIRE8kzqNqulzvrvFqv1k04Ina6NazhA9MkWKHUjT9rN8ca1uzZPcSTF
         PIbqlQgZreGsV0tqt0PgGJej6jdEFCkSoxXs/MFSfLiiqfg7aS9Y6EMCQH8z/JA3hxLm
         l2pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697573027; x=1698177827;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fSBA8Y5ldSBVAvzRxZ7Li+DNoyIbCk7Nk2AUhnicxhA=;
        b=CMDawXUDPDQpSYknx+izCccACKUt+UKAEEGPBvBPV1bzVAYIIwEA2sFX7HVuONc916
         IuTnvVhfqzgHqHCZ75D09HOJqk5aLlNszBksG8ug1EgsHrlu7/mdGfy+xHtN1a11u2L8
         ZHlCsGdT4mzjCM5NIjcCrC1A9d5gaVRIjH9nKq2MpADwTU3QdhR1blJjlLJYNkfBqf3w
         hHWWYikIxt5TpHigxMH2dPH3nSYK7FmHeA7qgFL1Y1fp/6fOuu8U7Pvk9NPWZU+MwUnx
         bIWlQGcMsPWqot3YarXoRZPxx6BEC3MyvJQc3T+tTUpK/+FhM+qqcZ38aHYDGjG36aWt
         fCKw==
X-Gm-Message-State: AOJu0YwlcxZli7L9CMZSl1laQ70l4Nf9mnY8nqI02aEmeNLolp38ehZ7
	j4o4fu3Esh0GHJL6NRVhl9mBO7srA5ZRNFtwYNGxUw3z84H/1KO8gPI=
X-Google-Smtp-Source: AGHT+IFoCBa0t/h8u2nGm3cZddeKO323b2WZ+Z3gZrzutavSs/pYYErpTgGXNujDsBAh3gS0KO9IzOM1lmzHfHtWzm4=
X-Received: by 2002:a2e:a7ca:0:b0:2c5:3e:6bdb with SMTP id x10-20020a2ea7ca000000b002c5003e6bdbmr2966107ljp.32.1697573026773;
 Tue, 17 Oct 2023 13:03:46 -0700 (PDT)
MIME-Version: 1.0
From: Jon Mason <jdmason@kudzu.us>
Date: Tue, 17 Oct 2023 16:03:35 -0400
Message-ID: <CAPoiz9yoEULf0_Nbhco=o922ac98d_5tvsSscM7-w6H0vuUfeg@mail.gmail.com>
Subject: meta-arm nanbield release freezing soon
To: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 17 Oct 2023 20:03:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5136

With the Yocto Project Nanbield release expected soon, meta-arm will
be following suit.

Barring an issue or something on the mailing list that is in the
process of being integrated, we will cut the meta-arm nanbield
release on Friday, 3 November 2023.  To this end, we will be freezing on
Monday, 30 October.  So, please push all outstanding commits as soon
as possible.  If you have something coming that you need in the
nanbield release, please let us know.

If there are questions or comments, please feel free to respond to
this thread on the mailing list or email me and/or Ross directly.

Thanks,
Jon

