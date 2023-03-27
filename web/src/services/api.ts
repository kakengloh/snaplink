import { Link } from '@/types/link';

const request = async <T>(
  method: 'GET' | 'POST' | 'PUT' | 'DELETE',
  path: string,
  { body = {}, headers = {} } = {}
): Promise<{ status: number; json: T }> => {
  const response = await fetch(`${process.env.NEXT_PUBLIC_API_URL}${path}`, {
    method,
    body: body ? JSON.stringify(body) : undefined,
    headers: {
      'Content-Type': 'application/json',
      Accept: 'application/json',
      ...headers,
    },
  });

  return {
    status: response.status,
    json: response.json() as T,
  };
};

export class ApiClient {
  async createLink(targetUrl: string) {
    const { json } = await request<Link>('POST', '/v1/links', {
      body: { target_url: targetUrl },
    });

    return json;
  }
}

export default new ApiClient();
